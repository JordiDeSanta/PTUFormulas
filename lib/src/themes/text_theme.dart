import 'package:flutter/material.dart';

class TextStyles {
  double getSize(BuildContext c) {
    double size = MediaQuery.of(c).size.aspectRatio;

    return size;
  }

  TextStyle getTitle(BuildContext c) {
    final TextStyle title =
        TextStyle(fontSize: getSize(c) * 60, fontWeight: FontWeight.w300);

    return title;
  }

  TextStyle getCourse(BuildContext c) {
    final TextStyle course =
        TextStyle(fontSize: getSize(c) * 60, fontWeight: FontWeight.w100);

    return course;
  }

  TextStyle getET(BuildContext c) {
    final TextStyle expansionTile =
        TextStyle(fontSize: getSize(c) * 40, fontWeight: FontWeight.w200);

    return expansionTile;
  }

  TextStyle getTriangle(BuildContext c) {
    final TextStyle triangle = TextStyle(
      fontSize: getSize(c) * 50,
      color: Colors.white,
      fontWeight: FontWeight.w200,
    );

    return triangle;
  }

  TextStyle getResult(BuildContext c) {
    final TextStyle result =
        TextStyle(fontSize: getSize(c) * 30, fontWeight: FontWeight.w300);

    return result;
  }
}
