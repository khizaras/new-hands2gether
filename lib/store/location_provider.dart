import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hands2gether/models/current_location_model.dart';

class LocationProvider with ChangeNotifier {
  late CurrentLocation _currentLocation;

  bool _isPermissionAccquired = false;
  get isPermissionAccquired => _isPermissionAccquired;
  get currentLocation => _currentLocation;

  void getLocation() {
    print("LocationProvider::Checking Loaction access::");
    _handleLocationPermission().then((accquired) {
      print("LocationProvider::Loaction access granted");
      if (accquired) {
        getAddress();
      }
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _isPermissionAccquired = false;
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _isPermissionAccquired = false;
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _isPermissionAccquired = false;
      return false;
    }

    return true;
  }

  Future<void> getAddress() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await placemarkFromCoordinates(position.latitude, position.longitude)
          .then((List<Placemark> placemarks) {
        Placemark fp = placemarks[0];
        CurrentLocation cl = CurrentLocation(
            administrativeArea: fp.administrativeArea,
            country: fp.country,
            isoCountryCode: fp.isoCountryCode,
            locality: fp.locality,
            postalCode: fp.postalCode,
            subAdministrativeArea: fp.subAdministrativeArea,
            subLocality: fp.subLocality);
        _currentLocation = cl;
        print("LocationProvider::${cl}");
        notifyListeners();
      }).catchError((e) {
        debugPrint(e);
      });
    });
  }
}
