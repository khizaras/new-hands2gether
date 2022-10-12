// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CurrentUserModel {
  final String? zipcode;
  final String? uid;
  final String? country;
  final String? signedup;
  final String? city;
  final String? name;
  final String? mobile;
  final String? locality;
  final bool? active;
  final String? state;
  final String? email;
  final String? geolocation;
  final String? photo;

  CurrentUserModel({
    this.zipcode,
    this.uid,
    this.country,
    this.signedup,
    this.city,
    this.name,
    this.mobile,
    this.locality,
    this.active,
    this.state,
    this.email,
    this.geolocation,
    this.photo,
  });

  CurrentUserModel copyWith({
    String? zipcode,
    String? uid,
    String? country,
    String? signedup,
    String? city,
    String? name,
    String? mobile,
    String? locality,
    bool? active,
    String? state,
    String? email,
    String? geolocation,
    String? photo,
  }) {
    return CurrentUserModel(
      zipcode: zipcode ?? this.zipcode,
      uid: uid ?? this.uid,
      country: country ?? this.country,
      signedup: signedup ?? this.signedup,
      city: city ?? this.city,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      locality: locality ?? this.locality,
      active: active ?? this.active,
      state: state ?? this.state,
      email: email ?? this.email,
      geolocation: geolocation ?? this.geolocation,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zipcode': zipcode,
      'uid': uid,
      'country': country,
      'signedup': signedup,
      'city': city,
      'name': name,
      'mobile': mobile,
      'locality': locality,
      'active': active,
      'state': state,
      'email': email,
      'geolocation': geolocation,
      'photo': photo,
    };
  }

  factory CurrentUserModel.fromMap(Map<String, dynamic> map) {
    return CurrentUserModel(
      zipcode: map['zipcode'] != null ? map['zipcode'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      signedup: map['signedup'] != null ? map['signedup'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      locality: map['locality'] != null ? map['locality'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
      state: map['state'] != null ? map['state'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      geolocation:
          map['geolocation'] != null ? map['geolocation'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUserModel.fromJson(String source) =>
      CurrentUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentUserModel(zipcode: $zipcode, uid: $uid, country: $country, signedup: $signedup, city: $city, name: $name, mobile: $mobile, locality: $locality, active: $active, state: $state, email: $email, geolocation: $geolocation, photo: $photo)';
  }

  @override
  bool operator ==(covariant CurrentUserModel other) {
    if (identical(this, other)) return true;

    return other.zipcode == zipcode &&
        other.uid == uid &&
        other.country == country &&
        other.signedup == signedup &&
        other.city == city &&
        other.name == name &&
        other.mobile == mobile &&
        other.locality == locality &&
        other.active == active &&
        other.state == state &&
        other.email == email &&
        other.geolocation == geolocation &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return zipcode.hashCode ^
        uid.hashCode ^
        country.hashCode ^
        signedup.hashCode ^
        city.hashCode ^
        name.hashCode ^
        mobile.hashCode ^
        locality.hashCode ^
        active.hashCode ^
        state.hashCode ^
        email.hashCode ^
        geolocation.hashCode ^
        photo.hashCode;
  }
}
