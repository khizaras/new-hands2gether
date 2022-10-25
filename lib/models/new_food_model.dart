// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class NewFoodModel {
  final String? title;
  final String? description;
  final int? helpType;
  final int? foodType;
  final int? quantity;
  final String? images;
  final int? status;
  final String? locality;
  final String? city;
  final String? state;
  final String? country;
  final String? zipcode;
  final String? uid;
  final String? userName;
  final String? email;
  final String? mobile;
  final String? validity;
  final String? createdEpoch;
  final String? createdDate;
  NewFoodModel({
    this.title,
    this.description,
    this.helpType,
    this.foodType,
    this.quantity,
    this.images,
    this.status,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.uid,
    this.userName,
    this.email,
    this.mobile,
    this.validity,
    this.createdEpoch,
    this.createdDate,
  });

  NewFoodModel copyWith({
    String? title,
    String? description,
    int? helpType,
    int? foodType,
    int? quantity,
    String? images,
    int? status,
    String? locality,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? uid,
    String? userName,
    String? email,
    String? mobile,
    String? validity,
    String? createdEpoch,
    String? createdDate,
  }) {
    return NewFoodModel(
      title: title ?? this.title,
      description: description ?? this.description,
      helpType: helpType ?? this.helpType,
      foodType: foodType ?? this.foodType,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      status: status ?? this.status,
      locality: locality ?? this.locality,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      validity: validity ?? this.validity,
      createdEpoch: createdEpoch ?? this.createdEpoch,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'helpType': helpType,
      'foodType': foodType,
      'quantity': quantity,
      'images': images,
      'status': status,
      'locality': locality,
      'city': city,
      'state': state,
      'country': country,
      'zipcode': zipcode,
      'uid': uid,
      'userName': userName,
      'email': email,
      'mobile': mobile,
      'validity': validity,
      'createdEpoch': createdEpoch,
      'createdDate': createdDate,
    };
  }

  factory NewFoodModel.fromMap(Map<String, dynamic> map) {
    return NewFoodModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      helpType: map['helpType'] != null ? map['helpType'] as int : null,
      foodType: map['foodType'] != null ? map['foodType'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      images: map['images'] != null ? map['images'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      locality: map['locality'] != null ? map['locality'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      validity: map['validity'] != null ? map['validity'] as String : null,
      createdEpoch:
          map['createdEpoch'] != null ? map['createdEpoch'] as String : null,
      createdDate:
          map['createdDate'] != null ? map['createdDate'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewFoodModel.fromJson(String source) =>
      NewFoodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewFoodModel(title: $title, description: $description, helpType: $helpType, foodType: $foodType, quantity: $quantity, images: $images, status: $status, locality: $locality, city: $city, state: $state, country: $country, zipcode: $zipcode, uid: $uid, userName: $userName, email: $email, mobile: $mobile, validity: $validity, createdEpoch: $createdEpoch, createdDate: $createdDate)';
  }

  @override
  bool operator ==(covariant NewFoodModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.helpType == helpType &&
        other.foodType == foodType &&
        other.quantity == quantity &&
        other.images == images &&
        other.status == status &&
        other.locality == locality &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.zipcode == zipcode &&
        other.uid == uid &&
        other.userName == userName &&
        other.email == email &&
        other.mobile == mobile &&
        other.validity == validity &&
        other.createdEpoch == createdEpoch &&
        other.createdDate == createdDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        helpType.hashCode ^
        foodType.hashCode ^
        quantity.hashCode ^
        images.hashCode ^
        status.hashCode ^
        locality.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        zipcode.hashCode ^
        uid.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        validity.hashCode ^
        createdEpoch.hashCode ^
        createdDate.hashCode;
  }
}
