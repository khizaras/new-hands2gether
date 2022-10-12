// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hands2gether/pages/indexPage.dart';
import 'package:hands2gether/pages/loginPage.dart';
import 'package:hands2gether/store/auth_user.dart';
import 'package:hands2gether/store/food_provider.dart';
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
    await FirebaseAuth.instance.signInAnonymously();
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticatedUser>(
              create: (_) => AuthenticatedUser()),
          ChangeNotifierProvider<FoodProvider>(create: (_) => FoodProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          context.read<FoodProvider>().fetchFoodFromFirebase();
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
                '/signup': (context) => SignupPage(),
              });
        }));
  }
}

//flutter router ?
