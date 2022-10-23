// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cached_network_image/cached_network_image.dart';
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
        body: CustomScrollView(slivers: [
      SliverAppBar(
        snap: true,
        pinned: false,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: foodCarousel(food, carouselHeight)), //FlexibleSpaceBar
        expandedHeight: 230,

        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ), //IconButton
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
            title: Center(
              child: Text('${food.description}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 50,
                      color: Colors.greenAccent[400]) //TextStyle
                  ), //Text
            ), //Center
          ), //ListTile
          childCount: 51,
        ), //SliverChildBuildDelegate
      )
      //SliverAppBar
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
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: i.toString(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ));
        },
      );
    }).toList(),
  );
}

Widget StackDetails(BuildContext context, NewFoodModel food) {
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;
  double carouselHeight = 330;
  return Container(
    child: Stack(
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      children: [
        foodCarousel(food, carouselHeight),
        Positioned(
            top: carouselHeight - 40,
            child: Container(
              alignment: Alignment.topLeft,
              height: height - carouselHeight + 150 * 1,
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
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    // appbar
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.indigo,
                            child: IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.arrowLeft),
                              iconSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Back to Listing")
                        ],
                      ),
                    ),
                    heading2(food.title.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    Text(food.description.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    Text(food.description.toString()),
                  ],
                ),
              ),
            )),
      ],
    ),
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
