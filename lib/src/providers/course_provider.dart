import 'package:flutter/material.dart';

class CourseArguments {
  String title;
  Color color;
  ImageProvider img;
  String route;

  CourseArguments({this.title, this.color, this.img, this.route});
}

class ContentArguments {
  String title;
  Color color;
  ImageProvider img;

  ContentArguments({this.title, this.color, this.img});
}
