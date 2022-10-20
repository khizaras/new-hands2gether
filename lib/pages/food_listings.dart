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

class _FoodListingsPageState extends State<FoodListingsPage> {
  @override
  Widget build(BuildContext contexts) {
    return Consumer<FoodProvider>(builder: (context, foods, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.indigo),
          title: Row(children: [
            Icon(
              Icons.fastfood_outlined,
              color: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Foods Listings",
                style: TextStyle(color: Colors.indigo),
              ),
            )
          ]),
        ),
        body: foodListView(context, foods.foodListings),
      );
    });
  }
}

Widget foodListView(BuildContext context, List<NewFoodModel> foods) {
  return SingleChildScrollView(
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
                radius: 20,
                backgroundColor: Color.fromARGB(255, 110, 118, 134),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    )),
              ),
              Divider(indent: 5),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 110, 118, 134),
                child: IconButton(
                    onPressed: () {},
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
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) {
              NewFoodModel food = foods[index];
              return RenderFoodItem(food, context);
            },
          ),
        )
      ],
    ),
  );
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
                  Text(
                    food.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                  ),
                  Text(
                    food.title.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontSize: 10),
                  )
                ],
              ),
            )
          ]),
    ),
  );
}
