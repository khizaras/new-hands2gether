import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget heading2(String text, {int lines = 1}) {
  return Text(
    text,
    maxLines: lines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        color: Color.fromARGB(255, 63, 81, 181),
        fontSize: 22,
        fontWeight: FontWeight.w300),
  );
}

Widget paragraph(String text) {
  return Text(
    text,
    style: TextStyle(color: Colors.indigo),
  );
}

/* 
Widget cacheNImg(String image, double height, {BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    color: Color.fromARGB(255, 131, 131, 131).withOpacity(1.0),
    colorBlendMode: BlendMode.softLight,
    fit: fit,
    height: height,
    imageUrl: image,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
 */
Widget cacheNImg(String image, double height, {BoxFit fit = BoxFit.cover}) {
  return Stack(children: <Widget>[
    Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(image),
        ),
      ),
      height: 330.0,
    ),
    Container(
      height: 330.0,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.bottomRight,
              end: FractionalOffset.topCenter,
              colors: [
                Color.fromARGB(255, 255, 255, 255).withOpacity(0.0),
                Color.fromARGB(255, 10, 10, 10).withOpacity(0.3),
              ],
              stops: [
                0.0,
                1.0
              ])),
    )
  ]);
}
