import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/units.dart';
export 'package:ptuformulas/src/providers/units.dart';

class CourseArguments {
  String title;
  Color color;
  Color contentsColor;
  ImageProvider img;
  String route;
  List<ContentArguments> contents;

  CourseArguments(
      {this.title,
      this.color,
      this.img,
      this.route,
      this.contents,
      this.contentsColor});
}

class ContentArguments {
  String title;
  ImageProvider img;
  String route;
  FormulaArguments formulas;
  Color ftColor;

  ContentArguments(
      {this.title, this.img, this.route, this.formulas, this.ftColor});
}

class FormulaArguments {
  Map<String, List> formulas;
  Color tilesColor;

  FormulaArguments({this.formulas, this.tilesColor});
}

class FormulaButtonArguments {
  Map<Param, double> params;
  double Function(Map<Param, double> m) formula;
  String pageName;
  bool bIsTriangle;
  List<String> resultsSystem;
  Unit resultUnit;
  double selectedResultUnit;
  Color triangleColor;

  FormulaButtonArguments({
    this.params,
    this.formula,
    this.pageName,
    this.bIsTriangle = false,
    this.resultsSystem = const ['', '', ''],
    this.resultUnit,
    this.selectedResultUnit = 1,
    this.triangleColor = Colors.purple,
  });
}

class Param {
  String name;
  Unit med;
  double selectedMed;

  Param({this.name, this.med, this.selectedMed = 1});

  double getValue(double input) {
    double v = input * selectedMed;
    print('my' + v.toString());
    return v;
  }

  double temp(double input) {
    switch (selectedMed.toInt()) {
      case 1:
        return input;
      case 2:
        return input + 273.15;
      case 3:
        return (input - 32) * 5 / 9 + 273.15;
        break;
      default:
        return 0.0;
    }
  }
}
