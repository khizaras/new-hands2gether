import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hands2gether/models/new_food_model.dart';
import 'dart:developer' as developer;

class FoodProvider with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<NewFoodModel> _foodListings = [];
  get foodListings => _foodListings;

  void fetchFoodFromFirebase() {
    _foodListings.clear();
    CollectionReference foods = firestore.collection('food');
    print("::FoodProvider::fetchFoodFromFirebase::");
    foods.orderBy("foodType").limit(6).get().then((event) {
      for (var doc in event.docs) {
        String jsonStr = jsonEncode(doc.data());
        NewFoodModel foodItem = NewFoodModel.fromJson(jsonStr);
        _foodListings.add(foodItem);
      }
      notifyListeners();
    });
  }

  Future<void> addFood() async {
    CollectionReference food = firestore.collection('food');
    NewFoodModel _food = NewFoodModel(
        description: "This is food2",
        foodType: 0,
        images:
            "https://www.shutterstock.com/shutterstock/photos/1721943142/display_1500/stock-photo-chicken-fillet-with-salad-healthy-food-keto-diet-diet-lunch-concept-top-view-on-white-1721943142.jpg",
        quantity: 10,
        title: "Needed food sir");

    await food.add(_food.toMap());
    fetchFoodFromFirebase();
  }
}
