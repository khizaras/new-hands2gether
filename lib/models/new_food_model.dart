// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class NewFoodModel {
  final String? title;
  final String? description;
  final String? images;
  final int? foodType;
  final int? quantity;
  NewFoodModel({
    this.title,
    this.description,
    this.images,
    this.foodType,
    this.quantity,
  });

  NewFoodModel copyWith({
    String? title,
    String? description,
    String? images,
    int? foodType,
    int? quantity,
  }) {
    return NewFoodModel(
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      foodType: foodType ?? this.foodType,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'images': images,
      'foodType': foodType,
      'quantity': quantity,
    };
  }

  factory NewFoodModel.fromMap(Map<String, dynamic> map) {
    return NewFoodModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null ? map['images'] as String : null,
      foodType: map['foodType'] != null ? map['foodType'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewFoodModel.fromJson(String source) =>
      NewFoodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewFoodModel(title: $title, description: $description, images: $images, foodType: $foodType, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant NewFoodModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.images == images &&
        other.foodType == foodType &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        images.hashCode ^
        foodType.hashCode ^
        quantity.hashCode;
  }
}
