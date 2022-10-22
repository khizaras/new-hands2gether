// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hands2gether/models/new_food_model.dart';

class FoodDetailView extends StatefulWidget {
  final NewFoodModel food_;

  const FoodDetailView({
    Key? key,
    required this.food_,
  }) : super(key: key);

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  Widget build(BuildContext context) {
    NewFoodModel food = widget.food_;
    List<String> imgs = food.images.toString().split("~~");

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
              food.title.toString(),
              style: TextStyle(color: Colors.indigo),
            ),
          )
        ]),
      ),
      body: ListView(
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
    );
  }
}
