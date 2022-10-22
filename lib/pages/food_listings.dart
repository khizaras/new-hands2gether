// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hands2gether/models/new_food_model.dart';
import 'package:hands2gether/store/food_provider.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

class FoodListingsPage extends StatefulWidget {
  const FoodListingsPage({Key? key}) : super(key: key);

  @override
  State<FoodListingsPage> createState() => _FoodListingsPageState();
}

Color primary = Color.fromARGB(255, 110, 118, 134);

class _FoodListingsPageState extends State<FoodListingsPage> {
  @override
  Widget build(BuildContext context) {
    List<NewFoodModel> Foods = context.watch<FoodProvider>().foodListings;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.indigo),
        title: Row(children: [
          /*   Icon(
              Icons.fastfood_outlined,
              color: Colors.indigo,
            ), */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Foods Listings",
              style: TextStyle(color: Colors.indigo),
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 110, 118, 134),
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return renderFilterPopup(context);
                            },
                          );
                        },
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        )),
                  ),
                  Divider(indent: 5),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 90, 141, 88),
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Foods.length,
                itemBuilder: (BuildContext context, int index) {
                  NewFoodModel food = Foods[index];
                  return RenderFoodItem(food, context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget RenderFoodItem(NewFoodModel food, BuildContext context) {
  var _size = MediaQuery.of(context).size;

  double width = _size.width;
  double height = _size.height;
  List<String> images = food.images.toString().split("~~");

  return Ribbon(
    nearLength: 55,
    farLength: 20,
    title: 'Want',
    titleStyle: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    color: Colors.indigoAccent,
    location: RibbonLocation.topEnd,
    child: Card(
      elevation: 0.7,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.3,
              child: Image.network(
                images[0],
                height: height * .12,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Text(
                    food.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                  ),
                  //description
                  Text(
                    food.title.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontSize: 10),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Food Type",
                              style: TextStyle(color: primary, fontSize: 10),
                            ),
                            Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                      color: Colors.indigo,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Text(
                                  "Vegetrian",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ))
                          ],
                        ),
                        Divider(
                          indent: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(color: primary, fontSize: 10),
                            ),
                            Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(
                                      color: Colors.indigo,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Text(
                                  "45",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ))
                          ],
                        ),
                        Divider(
                          indent: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Loication",
                              style: TextStyle(color: primary, fontSize: 8),
                            ),
                            Row(
                              children: [
                                Icon(Icons.map_outlined),
                                Text(
                                  "${food.locality ?? food.city}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(color: primary, fontSize: 10),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    ),
  );
}

Widget renderFilterPopup(BuildContext context) {
  TextEditingController cityController = TextEditingController();
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    child: Container(
      height: 500,
      padding: EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 5),
          Center(child: Text('Filter Food preferences')),
          SizedBox(height: 20),
          //city
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                prefixIcon: Icon(Icons.mail_lock_outlined),
                hintText: "City",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      context
                          .read<FoodProvider>()
                          .filterFood(cityController.text.toString());
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Colors.blueAccent)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              )
                            ]))),
                TextButton(
                    onPressed: () {
                      context.read<FoodProvider>().resetFilter;
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Reset Filter",
                                style: TextStyle(color: Colors.white),
                              )
                            ]))),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
