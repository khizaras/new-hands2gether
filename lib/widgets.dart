import 'package:flutter/material.dart';

Widget heading2(String text) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        color: Colors.indigo, fontSize: 22, fontWeight: FontWeight.w300),
  );
}
