// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CurrentLocation {
  final String? isoCountryCode;
  final bool permission;
  final String? country;
  final String? postalCode;
  final String? administrativeArea;
  final String? subAdministrativeArea;
  final String? locality;
  final String? subLocality;
  CurrentLocation({
    this.isoCountryCode,
    required this.permission,
    this.country,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
  });

  CurrentLocation copyWith({
    String? isoCountryCode,
    bool? permission,
    String? country,
    String? postalCode,
    String? administrativeArea,
    String? subAdministrativeArea,
    String? locality,
    String? subLocality,
  }) {
    return CurrentLocation(
      isoCountryCode: isoCountryCode ?? this.isoCountryCode,
      permission: permission ?? this.permission,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      subAdministrativeArea:
          subAdministrativeArea ?? this.subAdministrativeArea,
      locality: locality ?? this.locality,
      subLocality: subLocality ?? this.subLocality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isoCountryCode': isoCountryCode,
      'permission': permission,
      'country': country,
      'postalCode': postalCode,
      'administrativeArea': administrativeArea,
      'subAdministrativeArea': subAdministrativeArea,
      'locality': locality,
      'subLocality': subLocality,
    };
  }

  factory CurrentLocation.fromMap(Map<String, dynamic> map) {
    return CurrentLocation(
      isoCountryCode: map['isoCountryCode'] != null
          ? map['isoCountryCode'] as String
          : null,
      permission: map['permission'] as bool,
      country: map['country'] != null ? map['country'] as String : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      administrativeArea: map['administrativeArea'] != null
          ? map['administrativeArea'] as String
          : null,
      subAdministrativeArea: map['subAdministrativeArea'] != null
          ? map['subAdministrativeArea'] as String
          : null,
      locality: map['locality'] != null ? map['locality'] as String : null,
      subLocality:
          map['subLocality'] != null ? map['subLocality'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentLocation.fromJson(String source) =>
      CurrentLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentLocation(isoCountryCode: $isoCountryCode, permission: $permission, country: $country, postalCode: $postalCode, administrativeArea: $administrativeArea, subAdministrativeArea: $subAdministrativeArea, locality: $locality, subLocality: $subLocality)';
  }

  @override
  bool operator ==(covariant CurrentLocation other) {
    if (identical(this, other)) return true;

    return other.isoCountryCode == isoCountryCode &&
        other.permission == permission &&
        other.country == country &&
        other.postalCode == postalCode &&
        other.administrativeArea == administrativeArea &&
        other.subAdministrativeArea == subAdministrativeArea &&
        other.locality == locality &&
        other.subLocality == subLocality;
  }

  @override
  int get hashCode {
    return isoCountryCode.hashCode ^
        permission.hashCode ^
        country.hashCode ^
        postalCode.hashCode ^
        administrativeArea.hashCode ^
        subAdministrativeArea.hashCode ^
        locality.hashCode ^
        subLocality.hashCode;
  }
}
