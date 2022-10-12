import 'package:cloud_firestore/cloud_firestore.dart';
/*
class FoodModel {
  final String? title;
  final String? description;
  final String? uid;
  final String? email;
  final String? mobile;
  final String? locality;
  final String? city;
  final String? state;
  final String? country;
  final String? zipcode;
  final int? food_type;
  final int? quantity;
  final int? views;
  final int? replies;
  final int? status;
  final int? validity;
  final String? activities;
  final String? images;
  final String? created_date;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String documentID;

  FoodModel({
    this.title,
    this.description,
    this.uid,
    this.email,
    this.mobile,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.food_type,
    this.quantity,
    this.views,
    this.replies,
    this.status,
    this.validity,
    this.activities,
    this.images,
    this.created_date,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory FoodModel.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data();

    return FoodModel(
      title: map['title'] != null ? String?.fromMap(map['title']) : null,
      description: map['description'] != null
          ? String?.fromMap(map['description'])
          : null,
      uid: map['uid'] != null ? String?.fromMap(map['uid']) : null,
      email: map['email'] != null ? String?.fromMap(map['email']) : null,
      mobile: map['mobile'] != null ? String?.fromMap(map['mobile']) : null,
      locality:
          map['locality'] != null ? String?.fromMap(map['locality']) : null,
      city: map['city'] != null ? String?.fromMap(map['city']) : null,
      state: map['state'] != null ? String?.fromMap(map['state']) : null,
      country: map['country'] != null ? String?.fromMap(map['country']) : null,
      zipcode: map['zipcode'] != null ? String?.fromMap(map['zipcode']) : null,
      food_type:
          map['food_type'] != null ? int?.fromMap(map['food_type']) : null,
      quantity: map['quantity'] != null ? int?.fromMap(map['quantity']) : null,
      views: map['views'] != null ? int?.fromMap(map['views']) : null,
      replies: map['replies'] != null ? int?.fromMap(map['replies']) : null,
      status: map['status'] != null ? int?.fromMap(map['status']) : null,
      validity: map['validity'] != null ? int?.fromMap(map['validity']) : null,
      activities:
          map['activities'] != null ? String?.fromMap(map['activities']) : null,
      images: map['images'] != null ? String?.fromMap(map['images']) : null,
      created_date: map['created_date'] != null
          ? String?.fromMap(map['created_date'])
          : null,
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FoodModel(
      title: map['title'] != null ? String?.fromMap(map['title']) : null,
      description: map['description'] != null
          ? String?.fromMap(map['description'])
          : null,
      uid: map['uid'] != null ? String?.fromMap(map['uid']) : null,
      email: map['email'] != null ? String?.fromMap(map['email']) : null,
      mobile: map['mobile'] != null ? String?.fromMap(map['mobile']) : null,
      locality:
          map['locality'] != null ? String?.fromMap(map['locality']) : null,
      city: map['city'] != null ? String?.fromMap(map['city']) : null,
      state: map['state'] != null ? String?.fromMap(map['state']) : null,
      country: map['country'] != null ? String?.fromMap(map['country']) : null,
      zipcode: map['zipcode'] != null ? String?.fromMap(map['zipcode']) : null,
      food_type:
          map['food_type'] != null ? int?.fromMap(map['food_type']) : null,
      quantity: map['quantity'] != null ? int?.fromMap(map['quantity']) : null,
      views: map['views'] != null ? int?.fromMap(map['views']) : null,
      replies: map['replies'] != null ? int?.fromMap(map['replies']) : null,
      status: map['status'] != null ? int?.fromMap(map['status']) : null,
      validity: map['validity'] != null ? int?.fromMap(map['validity']) : null,
      activities:
          map['activities'] != null ? String?.fromMap(map['activities']) : null,
      images: map['images'] != null ? String?.fromMap(map['images']) : null,
      created_date: map['created_date'] != null
          ? String?.fromMap(map['created_date'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'uid': uid,
        'email': email,
        'mobile': mobile,
        'locality': locality,
        'city': city,
        'state': state,
        'country': country,
        'zipcode': zipcode,
        'food_type': food_type,
        'quantity': quantity,
        'views': views,
        'replies': replies,
        'status': status,
        'validity': validity,
        'activities': activities,
        'images': images,
        'created_date': created_date,
      };

  FoodModel copyWith({
    String? title,
    String? description,
    String? uid,
    String? email,
    String? mobile,
    String? locality,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    int? food_type,
    int? quantity,
    int? views,
    int? replies,
    int? status,
    int? validity,
    String? activities,
    String? images,
    String? created_date,
  }) {
    return FoodModel(
      title: title ?? this.title,
      description: description ?? this.description,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      locality: locality ?? this.locality,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      food_type: food_type ?? this.food_type,
      quantity: quantity ?? this.quantity,
      views: views ?? this.views,
      replies: replies ?? this.replies,
      status: status ?? this.status,
      validity: validity ?? this.validity,
      activities: activities ?? this.activities,
      images: images ?? this.images,
      created_date: created_date ?? this.created_date,
    );
  }

  @override
  String toString() {
    return '${title.toString()}, ${description.toString()}, ${uid.toString()}, ${email.toString()}, ${mobile.toString()}, ${locality.toString()}, ${city.toString()}, ${state.toString()}, ${country.toString()}, ${zipcode.toString()}, ${food_type.toString()}, ${quantity.toString()}, ${views.toString()}, ${replies.toString()}, ${status.toString()}, ${validity.toString()}, ${activities.toString()}, ${images.toString()}, ${created_date.toString()}, ';
  }

  @override
  bool operator ==(other) =>
      other is FoodModel && documentID == other.documentID;

  int get hashCode => documentID.hashCode;
}
*/