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
        'p': (BuildContext context) => ContentPage(),
        'm': (BuildContext context) => ContentPage(),
        'q': (BuildContext context) => ContentPage(),
      },
    );
  }
}
