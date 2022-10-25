// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hands2gether/models/current_user_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hands2gether/models/new_food_model.dart';
import 'package:hands2gether/widgets.dart';

class FoodDetailView extends StatefulWidget {
  final NewFoodModel food_;

  const FoodDetailView({
    Key? key,
    required this.food_,
  }) : super(key: key);

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState(this.food_);
}

class _FoodDetailViewState extends State<FoodDetailView> {
  NewFoodModel food = NewFoodModel();
  _FoodDetailViewState(this.food);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CurrentUserModel author = CurrentUserModel();

  bool isAuthorLoaded = false;
  Future<void> fetchAuthor() async {
    CollectionReference userCollection = firestore.collection('users');
    DocumentSnapshot userSnap = await userCollection.doc(food.uid).get();
    String jsonStr = jsonEncode(userSnap.data());
    setState(() {
      isAuthorLoaded = true;
      author = CurrentUserModel.fromJson(jsonStr);
    });
  }

  @override
  void initState() {
    print("_food is ${food}");
    print("::Getting Author information::");
    super.initState();
    fetchAuthor();
  }

  @override
  void dispose() {
    super.dispose();
    print("::unmount::");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double carouselHeight = 330;

    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 0,
        title: Text(
          "Go back",
          style: TextStyle(color: Colors.white),
        ),
        snap: true,
        backgroundColor: Colors.white,
        pinned: false,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: foodCarousel(food, carouselHeight)), //FlexibleSpaceBar
        expandedHeight: 230,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            tooltip: 'Go back',
            onPressed: () {
              Navigator.pop(context);
            }), //IconButton
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // titile
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(child: heading2(food.title.toString(), lines: 2)),
                  Text(
                      "${food.locality ?? ""} ${food.city ?? ""} ${food.state ?? ""} ${food.country ?? ""}"),
                ],
              ),

              //divider
              SizedBox(
                height: 10,
                child: const Divider(
                  color: Colors.blueGrey,
                  height: 10,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),

              // details 1
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Listing Type",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text("Help - Wanted",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Posted",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(food.createdDate.toString(),
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Prefrences",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text("Veg / Non veg",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //details 2
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Req Quantity",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text("30", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Valid till",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(food.createdDate.toString(),
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //description
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        food.description.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),

              //divider
              SizedBox(
                height: 10,
                child: const Divider(
                  color: Colors.blueGrey,
                  height: 10,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),

              // Author info
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Posted By",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isAuthorLoaded
                            ? Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.indigo[900],
                                    backgroundImage:
                                        NetworkImage(author.photo.toString()),
                                  ),
                                  Text(author.name.toString())
                                ],
                              )
                            : CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                strokeWidth: 5,
                              ),
                      ],
                    )
                  ],
                ),
              ),

              //divider
              SizedBox(
                height: 10,
                child: const Divider(
                  color: Colors.blueGrey,
                  height: 10,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}

Widget foodCarousel(NewFoodModel food, double carouselHeight) {
  List<String> imgs = food.images.toString().split("~~");
  return CarouselSlider(
    options: CarouselOptions(height: carouselHeight),
    items: imgs.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(color: Colors.transparent),
            child: cacheNImg(
              i.toString(),
              0,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }).toList(),
  );
}







/* Crousel 
   ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: imgs.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(color: Colors.indigo),
                        child: Image.network(
                          i.toString(),
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),


 */
