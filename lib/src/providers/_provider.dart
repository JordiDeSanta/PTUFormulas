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
  FormulaArguments formulas;

  ContentArguments(
      {this.title, this.color, this.img, this.route, this.formulas});
}

class FormulaArguments {
  Map<String, List<ImageProvider>> formulas;
  Color cardColor;

  FormulaArguments({this.formulas, this.cardColor});
}

class FormulaButtonArguments {
  Map<String, int> params;
  Function(List<int> l) formula;

  FormulaButtonArguments({this.params, this.formula});
}
