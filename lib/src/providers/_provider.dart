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
  Map<String, List> formulas;
  Color cardColor;

  FormulaArguments({this.formulas, this.cardColor});
}

class FormulaButtonArguments {
  Map<String, double> params;
  double Function(Map<String, double> m) formula;
  Color pageColor;
  String pageName;
  bool bIsTriangle = false;
  List<String> resultsSystem = [''];

  FormulaButtonArguments(
      {this.params,
      this.formula,
      this.pageColor,
      this.pageName,
      this.bIsTriangle});
}
