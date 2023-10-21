 import 'package:flutter/material.dart';

Container customImage(String imageUrl, double height) {
    return Container(
        margin: EdgeInsets.all(5),
        height: height,
        child: Image.asset(
          "$imageUrl",
          fit: BoxFit.cover,
        ),
      );
  }