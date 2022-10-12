import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hands2gether/models/new_food_model.dart';
import 'package:hands2gether/pages/loginPage.dart';
import 'package:hands2gether/store/food_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/rendering/box.dart';

import '../models/current_user_model.dart';
import '../store/auth_user.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}
//413eb8

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color primary = Colors.indigo;
    CurrentUserModel user = context.watch<AuthenticatedUser>().currentUser;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 1,
              padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
              child: Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.menu),
                    color: Colors.indigo[900],
                  )),
          centerTitle: true,
          /*title: Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),*/
          actions: [
            Row(
              children: [
                IconButton(
                    color: Colors.indigo[900],
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        ),
                    icon: Icon(Icons.person_outline_sharp)),
              ],
            ),
          ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Subheader
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      user.name == "Guest"
                          ? CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.indigo[900],
                              child: IconButton(
                                icon: Icon(
                                  size: 25,
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ))
                          : CircleAvatar(
                              backgroundColor: Colors.indigo[900],
                              backgroundImage:
                                  NetworkImage(user.photo.toString()),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Hi  ${getUserName(context)}",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Welcome to hands2gether",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //searchbar
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                style: TextStyle(height: 1),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Search here",
                    fillColor: Colors.white70),
              ),
            ),

            // categories section
            Container(
              height: 100,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Card(
                            child: Container(
                              width: width / 4,
                              child: InkWell(
                                onTap: () {
                                  context.read<FoodProvider>().addFood();
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.food_bank,
                                      color: primary,
                                    ),
                                    Text(
                                      "Food",
                                      style: TextStyle(color: primary),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: width / 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_location_rounded,
                                    color: primary,
                                  ),
                                  Text(
                                    "Cloths",
                                    style: TextStyle(color: primary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: width / 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    color: primary,
                                  ),
                                  Text(
                                    "Education",
                                    style: TextStyle(color: primary),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recent Listings"),
                      TextButton(onPressed: () {}, child: Text("Show All")),
                    ],
                  ),
                  RecentListings(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget RecentListings(BuildContext context) {
  List<NewFoodModel> foods = context.watch<FoodProvider>().foodListings;
  List<String> getImage(imagerul) {
    List<String> images = imagerul.toString().split("~~");
    return images;
  }

  final orientation = MediaQuery.of(context).orientation;

  return GridView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: NeverScrollableScrollPhysics(),
    itemCount: foods.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
    itemBuilder: (BuildContext context, int i) {
      NewFoodModel food = foods[i];
      String image = getImage(food.images)[0];

      return Card(
        elevation: 1,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image(
                  image: NetworkImage(image),
                  width: double.infinity,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Text(food.title.toString())),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Text(
                    food.description.toString(),
                    maxLines: 2,
                    style: TextStyle(fontSize: 10),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: 10,
                    ),
                    Text(
                      "Triplicane",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ]),
      );
    },
  );
}
