import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/tile_widget.dart';

class CoursePage extends StatelessWidget {
  final String courseTitle;

  CoursePage(this.courseTitle);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(courseTitle, style: styles.course),
          centerTitle: true,
          backgroundColor: Colors.purple[300],
          elevation: 0.0,
          toolbarHeight: 80.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: 40,
                image: AssetImage('assets/img/fisica.png'),
                color: Colors.white,
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.0),
                TileWidget(
                  'Ondas',
                  Colors.purple[100],
                  'assets/img/ondas.png',
                  'course',
                ),
                TileWidget(
                  'Mecánica',
                  Colors.purple[100],
                  'assets/img/mecanica.png',
                  'course',
                ),
                TileWidget(
                  'Energía',
                  Colors.purple[100],
                  'assets/img/energia.png',
                  'course',
                ),
                TileWidget(
                  'Electridad y Magnetismo',
                  Colors.purple[100],
                  'assets/img/magneto.png',
                  'course',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
