import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:hands2gether/models/current_user_model.dart';

class AuthenticatedUser with ChangeNotifier {
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

  void updateLogin(User authenticatedUser) {
    print(authenticatedUser);
    /* 
 User(displayName: A.S.Khizar Ahmed, 
 email: khizaras@gmail.com, 
 emailVerified: true, 
 isAnonymous: false, 
 metadata: UserMetadata(creationTime: 1970-01-01 00:00:00.000Z, 
 lastSignInTime: 2022-10-12 08:21:56.603Z),
  phoneNumber: null, 
  photoURL: https://lh3.googleusercontent.com/a/ALm5wu0m86H-dnnWYxv5HWH4OqeovicUh9JiwjWYNg6G3w=s96-c, 
  providerData, [UserInfo(displayName: A.S.Khizar Ahmed, email: khizaras@gmail.com, phoneNumber: null, photoURL: https://lh3.googleusercontent.com/a/ALm5wu0m86H-dnnWYxv5HWH4OqeovicUh9JiwjWYNg6G3w=s96-c, providerId: google.com, uid: 103881450309886053926)], refreshToken: , tenantId: null, uid: yC7txDgO1AjK45mVSnFcfiBGIXIU)

     */
    userData = CurrentUserModel(
        photo: authenticatedUser.photoURL,
        active: true,
        city: "Chennai",
        country: "IN",
        name: authenticatedUser.displayName ?? "Guest",
        email: authenticatedUser.email,
        geolocation: " ",
        locality: " ",
        mobile: authenticatedUser.phoneNumber,
        state: "",
        uid: authenticatedUser.uid,
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