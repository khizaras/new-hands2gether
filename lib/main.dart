// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hands2gether/pages/food_listings.dart';
import 'package:hands2gether/pages/indexPage.dart';
import 'package:hands2gether/pages/loginPage.dart';
import 'package:hands2gether/pages/profile.dart';
import 'package:hands2gether/store/auth_user.dart';
import 'package:hands2gether/store/food_provider.dart';
import 'package:hands2gether/store/location_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  FirebaseFirestore.instance.settings = Settings(
    host: "localhost:8500",
    sslEnabled: false,
    persistenceEnabled: false,
  );
  try {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8500);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    //await FirebaseAuth.instance.signInAnonymously();
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* _getCurrentPosition(context).then((position) {
      double latitude = position[0];
      double longitude = position[1];
      _getAddressFromLatLng(latitude, longitude).then((placemark) {
        print(placemark);
      });
    }); */

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticatedUser>(
              create: (_) => AuthenticatedUser()),
          ChangeNotifierProvider<LocationProvider>(
              create: (_) => LocationProvider()),
          ChangeNotifierProvider<FoodProvider>(create: (_) => FoodProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          context.read<FoodProvider>().fetchFoodFromFirebase();
          context.read<LocationProvider>().getLocation();
          bool permissionAccquired =
              context.read<LocationProvider>().isPermissionAccquired;

          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primarySwatch: Colors.indigo,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => IndexPage(),
                '/food': (context) => FoodListingsPage(),
                '/signup': (context) => SignupPage(),
                '/profile': (context) => UpdateProfilePage(),
              });
        }));
  }
}

Future<bool> _handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<List<double>> _getCurrentPosition(BuildContext context) async {
  List<double> pos = [];
  final hasPermission = await _handleLocationPermission(context);

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  if (!hasPermission) throw "No permission";
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
    pos.add(position.latitude);
    pos.add(position.longitude);

    return pos;
    //print(position);
  }).catchError((e) {
    debugPrint(e);
  });
  return pos;
}

Future<List<String>> _getAddressFromLatLng(
    double latitude, double longitude) async {
  List<String> pos = [];
  await placemarkFromCoordinates(latitude, longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    pos.add(place.isoCountryCode.toString());
    pos.add(place.country.toString());
    pos.add(place.postalCode.toString());
    pos.add(place.administrativeArea.toString());
    pos.add(place.subAdministrativeArea.toString());
    pos.add(place.locality.toString());
    pos.add(place.subLocality.toString());
    print(place.toJson());
    /*    setState(() {
      _currentAddress =
         '${place.street}, ${place.subLocality},
          ${place.subAdministrativeArea}, ${place.postalCode}';
    }); */
    return place;
  }).catchError((e) {
    debugPrint(e);
  });
  return pos;
}

  
//flutter router ?
