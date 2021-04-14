import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptuformulas/src/pages/content_page.dart';
import 'package:ptuformulas/src/pages/home_page.dart';
import 'package:ptuformulas/src/pages/course_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      title: 'PTU Formulas',
      initialRoute: 'home',
      debugShowCheckedModeBanner: true,
      routes: {
        'home': (BuildContext context) => HomePage(),
        'math': (BuildContext context) => CoursePage(),
        'physics': (BuildContext context) => CoursePage(),
        'quimics': (BuildContext context) => CoursePage(),
        'waves': (BuildContext context) => ContentPage(),
        'mechanics': (BuildContext context) => ContentPage(),
        'energy': (BuildContext context) => ContentPage(),
        'eandm': (BuildContext context) => ContentPage(),
        'test': (BuildContext context) => ContentPage(),
        'number': (BuildContext context) => ContentPage(),
      },
    );
  }
}
