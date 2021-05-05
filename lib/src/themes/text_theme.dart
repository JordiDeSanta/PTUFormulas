import 'package:flutter/material.dart';

class TextStyles {
  double getWidth(BuildContext c) {
    double width = MediaQuery.of(c).size.width;

    return width;
  }

  TextStyle getTitle(BuildContext c) {
    final TextStyle title =
        TextStyle(fontSize: getWidth(c) * 0.01, fontWeight: FontWeight.w300);

    return title;
  }

  TextStyle getCourse(BuildContext c) {
    final TextStyle course =
        TextStyle(fontSize: getWidth(c) * 0.01, fontWeight: FontWeight.w100);

    return course;
  }

  TextStyle getET(BuildContext c) {
    final TextStyle expansionTile =
        TextStyle(fontSize: getWidth(c) * 0.01, fontWeight: FontWeight.w200);

    return expansionTile;
  }

  TextStyle getTriangle(BuildContext c) {
    final TextStyle triangle = TextStyle(
        fontSize: getWidth(c) * 0.01,
        color: Colors.white,
        fontWeight: FontWeight.w200);

    return triangle;
  }

  TextStyle getResult(BuildContext c) {
    final TextStyle result =
        TextStyle(fontSize: getWidth(c) * 0.01, fontWeight: FontWeight.w300);

    return result;
  }
}
