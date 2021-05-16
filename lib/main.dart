import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptuformulas/src/pages/content_page.dart';
import 'package:ptuformulas/src/pages/course_page.dart';
import 'package:ptuformulas/src/pages/formula_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ptuformulas/src/pages/new_hp.dart';
import 'package:ptuformulas/src/providers/ad_state.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context) => NewHomePage(),
        'formula': (BuildContext context) => FormulaPage(),
        'math': (BuildContext context) => CoursePage(),
        'physics': (BuildContext context) => CoursePage(),
        'quimics': (BuildContext context) => CoursePage(),
        'p': (BuildContext context) => ContentPage(),
        'm': (BuildContext context) => ContentPage(),
        'q': (BuildContext context) => ContentPage(),
      },
      theme: ThemeData(accentColor: Colors.white),
    );
  }
}
