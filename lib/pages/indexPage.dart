import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hands2gether/models/current_location_model.dart';
import 'package:hands2gether/models/new_food_model.dart';
import 'package:hands2gether/pages/food_detail_view.dart';
import 'package:hands2gether/pages/food_listings.dart';
import 'package:hands2gether/pages/loginPage.dart';
import 'package:hands2gether/pages/profile.dart';
import 'package:hands2gether/store/food_provider.dart';
import 'package:hands2gether/store/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

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
    CurrentLocation curloc = context.watch<LocationProvider>().currentLocation;

/*     Future<Position> position = _determinePosition();
    position.then((value) {
      print(value);
      print(value.toJson());
    }); */
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
                    icon: Icon(Icons.sort),
                    color: Colors.indigo[900],
                  )),
          centerTitle: false,
          title: Row(
            children: [
              Icon(
                Icons.pin_drop,
                color: Colors.indigo,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "${curloc.administrativeArea},${curloc.country}",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          /*title: Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),*/
          actions: [
            Row(
              children: [
                user.uid == ""
                    ? IconButton(
                        color: Colors.indigo[900],
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()),
                            ),
                        icon: Icon(Icons.person_outline_sharp))
                    : Container(),
                user.uid != ""
                    ? IconButton(
                        color: Colors.indigo[900],
                        onPressed: () =>
                            {context.read<AuthenticatedUser>().logoutUser()},
                        icon: Icon(Icons.logout))
                    : Container(),
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
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateProfilePage()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.indigo[900],
                                backgroundImage:
                                    NetworkImage(user.photo.toString()),
                              ),
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                style: TextStyle(
                  height: 1,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 216, 216, 216)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 25, 32, 157)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Search Food, Cloths & Education . . .",
                    fillColor: Colors.white),
              ),
            ),

            // new categ
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(15, 20, 10, 10),
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                children: [
                  RenderCategory(
                      context, "Food", "assets/images/food-icon.png"),
                  RenderCategory(
                      context, "Cloths", "assets/images/cloth-icon.png"),
                  RenderCategory(
                      context, "Books", "assets/images/books-icon.png"),
                  RenderCategory(
                      context, "Food", "assets/images/food-icon.png"),
                ],
              ),
            ),

            //banner
            Container(
              margin: EdgeInsets.all(15),
              height: height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(63, 81, 181, 1),
                      blurRadius: 1.0,
                    ),
                  ]),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recent Listings"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodListingsPage()));
                          },
                          child: Text("Show All")),
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

      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetailView(food_: food)));
        },
        child: Card(
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
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 10,
                          ),
                          Text(
                            food.quantity.toString(),
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
        ),
      );
    },
  );
}

Widget RenderCategory(
    BuildContext context, String catName, String imageLocation) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    width: 75,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 1.0,
        ),
      ],
      border: Border.all(color: Colors.white12),
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            top: -10,
            child: Image.asset(
              imageLocation,
              height: 40,
              fit: BoxFit.fitHeight,
            )),
        Positioned(
            top: 30,
            child: Text(
              catName,
              style: TextStyle(color: Colors.indigo),
            ))
      ],
    ),
  );
}


// card category

// categories section
/* Container(
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
 */
