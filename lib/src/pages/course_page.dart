import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/course_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/tile_widget.dart';

class CoursePage extends StatelessWidget {
  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    final CourseArguments args = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(args.title, style: styles.course),
          centerTitle: true,
          backgroundColor: args.color,
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
                image: args.img,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
