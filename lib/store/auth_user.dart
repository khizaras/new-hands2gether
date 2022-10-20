import 'dart:core';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:hands2gether/models/current_user_model.dart';

class AuthenticatedUser with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isProfileUpdate = false;
  CurrentUserModel? userData = CurrentUserModel(
      active: true,
      photo: "",
      city: "",
      country: "",
      name: "Guest",
      email: "",
      geolocation: "",
      locality: "",
      mobile: "",
      state: "",
      uid: "",
      signedup: "",
      zipcode: "");
  get currentUser => userData;
  get isProfileUpdate => _isProfileUpdate;

  Future<void> updateLogin(User authenticatedUser) async {
    //check if registered user

    CollectionReference userCollection = firestore.collection('users');
    DocumentSnapshot user =
        await userCollection.doc(authenticatedUser.uid).get();
    if (user.data() == null) {
      print("User records not found on the firestore");

      _isProfileUpdate = false;
      userData = CurrentUserModel(
          photo: authenticatedUser.photoURL,
          name: authenticatedUser.displayName,
          email: authenticatedUser.email,
          mobile: authenticatedUser.phoneNumber,
          uid: authenticatedUser.uid);
    } else {
      print("User records found on the firestore");
      userData = CurrentUserModel(
        photo: authenticatedUser.photoURL,
        active: user["active"]!,
        city: user["city"]!,
        country: user["country"]!,
        name: authenticatedUser.displayName,
        email: authenticatedUser.email,
        geolocation: user["geolocation"]!,
        locality: user["locality"]!,
        mobile: authenticatedUser.phoneNumber,
        state: user["state"]!,
        uid: authenticatedUser.uid,
        signedup: user["signedup"]!,
        zipcode: user["zipcode"]!,
      );
      _isProfileUpdate = true;
    }

    print(userData);
    notifyListeners();
  }

  void logoutUser() {
    FirebaseAuth.instance.signOut();
    userData = CurrentUserModel(
        active: true,
        photo: "",
        city: "",
        country: "",
        name: "Guest",
        email: "",
        geolocation: "",
        locality: "",
        mobile: "",
        state: "",
        uid: "",
        signedup: "",
        zipcode: "");
    print(userData);
    notifyListeners();
  }
}



 /* NewFoodModel foodItem = NewFoodModel(
          country: doc["country"] ?? null,
          createdDate: doc["createdDate"] ?? null,
          createdEpoch: doc["createdEpoch"] ?? null,
          email: doc["email"] ?? null,
          locality: doc["locality"] ?? null,
          mobile: doc["mobile"] ?? null,
          state: doc["state"] ?? null,
          status: doc["status"] ?? 0,
          uid: doc["uid"] ?? null,
          description: doc["description"] ?? null,
          userName: doc["userName"] ?? null,
          validity: doc["validity"] ?? 0,
          zipcode: doc["zipcode"] ?? null,
          city: doc["city"] ?? null,
          foodType: doc["foodType"] ?? 0,
          images: doc["images"] ?? null,
          quantity: doc["quantity"] ?? 0,
          title: doc["title"] ?? null,
        ); */