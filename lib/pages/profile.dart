// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hands2gether/models/current_user_model.dart';
import 'package:hands2gether/store/auth_user.dart';
import 'package:provider/provider.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticatedUser>(builder: (context, auth, child) {
      List<TextEditingController> profileController =
          List.generate(13, (i) => TextEditingController());

      CurrentUserModel? userData = auth.userData;

      void updateUserData() {}

      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Update profile", style: TextStyle(color: Colors.indigo)),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 167, 224, 250),
          toolbarTextStyle: TextStyle(color: Colors.indigo),
          iconTheme: IconThemeData(color: Colors.indigo),
        ),
        body: Container(
            child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg2.jpg"),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor:
                                  Color.fromARGB(255, 243, 243, 243),
                              child: ClipOval(
                                child: Image.network(
                                  auth.userData!.photo.toString(),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${auth.userData!.name}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              "${auth.userData!.email}",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54),
                            ),
                          ),
                          //statistics
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0,
                                          color: Colors.lightBlue.shade600),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.listCheck,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "My Listings",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black38),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0,
                                          color: Colors.lightBlue.shade600),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.listNumeric,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "Help Requested",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black38),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0,
                                          color: Colors.lightBlue.shade600),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.bell,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        "Notifications",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black38),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          //menu items
                          Container(
                            width: MediaQuery.of(context).size.width * .9,
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //update Profile
                                Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.bell,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Update Profile",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.arrowRight,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.plugCirclePlus,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Add Listings",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.arrowRight,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )),
                                ),

                                Container(
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.signOut,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Sign out",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.arrowRight,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      );
    });
  }
}

Widget RoundedTextField(labelText, initialValue,
    {required Null Function(dynamic value) onChanged}) {
  return Container(
    child: TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: onChanged,
    ),
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(5),
  );
}

class UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticatedUser>(builder: (context, auth, child) {
      List<TextEditingController> profileController =
          List.generate(13, (i) => TextEditingController());

      CurrentUserModel? userData = auth.userData;

      void updateUserData() {}

      return Scaffold(
          /*  appBar: AppBar(
            centerTitle: false,
            title:
                Text("Update profile", style: TextStyle(color: Colors.indigo)),
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarTextStyle: TextStyle(color: Colors.indigo),
            iconTheme: IconThemeData(color: Colors.indigo),
          ), */
          body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg2.jpg"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Positioned(
            top: 160,
            left: 10,
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: CircleAvatar(
                      maxRadius: 35,
                      backgroundColor: Colors.indigo[900],
                      backgroundImage:
                          NetworkImage(auth.userData!.photo.toString()),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${auth.userData!.name}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${auth.userData!.email}",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 250, 0, 0),
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Form(
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("My Listings"),
                                    Divider(),
                                    Text(
                                      "0",
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("My Listings"),
                                    Divider(),
                                    Text(
                                      "0",
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                controller: profileController[0]
                                  ..text = auth.userData!.name!,
                                onChanged: (text) {},
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.people_alt_outlined),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                controller: profileController[1]
                                  ..text = auth.userData!.email!,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.mail_lock_outlined),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                controller: profileController[2]..text = "",
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.phone_android_sharp),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Mobile",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Divider(thickness: 2, endIndent: 5),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.locality,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.streetview),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Area / Locality",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.city,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.pin_drop),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "City",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.state,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.pin_drop),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "State",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.country,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(FontAwesomeIcons.earth),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Country",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.mobile,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.phone_android_sharp),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Mobile",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: TextFormField(
                                initialValue: auth.userData!.mobile,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Icon(Icons.phone_android_sharp),
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Mobile",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.indigo[600],
                                    textStyle: TextStyle(color: Colors.white)),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Text("Update",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.userCheck,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                )),
          )
        ],
      ));
    });
  }
}
