import 'package:flutter/material.dart';

class CourseArguments {
  String title;
  Color color;
  ImageProvider img;
  String route;
  List<ContentArguments> contents;

  CourseArguments(
      {this.title, this.color, this.img, this.route, this.contents});
}

class ContentArguments {
  String title;
  Color color;
  ImageProvider img;
  String route;
  ImageProvider contentImg;

  ContentArguments(
      {this.title, this.color, this.img, this.route, this.contentImg});
}
