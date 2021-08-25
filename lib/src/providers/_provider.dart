import 'package:ezformulas/src/providers/units.dart';
import 'package:flutter/material.dart';

class CourseArguments {
  String title;
  List<ContentArguments> contents;

  CourseArguments({
    required this.title,
    required this.contents,
  });
}

class ContentArguments {
  String title;
  IconData? icon;
  String? text;
  List<FormulaArguments> formulas;

  ContentArguments({
    required this.title,
    this.icon,
    this.text,
    required this.formulas,
  });
}

class FormulaArguments {
  String char;
  String name;
  String? svgRoute;
  String? imgRoute;
  Map<Param, double>? params;
  double Function(Map<Param, double> m)? formula;
  double selectedResultUnit;
  Unit? resultUnit;

  FormulaArguments({
    required this.char,
    required this.name,
    this.svgRoute,
    this.params,
    this.formula,
    this.selectedResultUnit = 1,
    this.resultUnit,
    this.imgRoute,
  });
}

class Param {
  String name;
  Unit? med;
  double selectedMed;

  Param({
    required this.name,
    this.med,
    this.selectedMed = 1,
  });

  double getValue(double input) {
    double v = input * selectedMed;
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
      default:
        return 0.0;
    }
  }
}
