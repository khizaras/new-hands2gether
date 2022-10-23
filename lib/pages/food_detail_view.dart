// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hands2gether/models/new_food_model.dart';
import 'package:hands2gether/widgets.dart';

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
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double carouselHeight = 330;

    return Scaffold(
        /* appBar: AppBar(
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
        ), */
        body: Container(
      height: height * 1,
      child: Column(children: [
        Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.none,
          children: [
            foodCarousel(food, carouselHeight),
            Positioned(
                top: carouselHeight - 30,
                child: Container(
                  alignment: Alignment.topLeft,
                  height: height - carouselHeight + 50 * 1,
                  width: width * 1,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 20, 20, 20),
                        blurRadius: 3.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ), //
                  ),
                  child: ListView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      // appbar
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.indigo,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.arrowLeft)),
                            ),
                            Text("Back to Listing")
                          ],
                        ),
                      ),
                      heading2(food.title.toString()),
                    ],
                  ),
                )),
          ],
        )
      ]),
    ));
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
              decoration: BoxDecoration(color: Colors.indigo),
              child: Image.network(
                i.toString(),
                fit: BoxFit.cover,
              ));
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
