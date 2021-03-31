import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/course_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/course_tile_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PTU Fórmulas', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              CourseTileWidget(
                CourseArguments(
                  color: Colors.blue[300],
                  img: AssetImage('assets/img/matematica.png'),
                  route: 'physics',
                  title: 'Matemática',
                ),
              ),
              CourseTileWidget(
                CourseArguments(
                  color: Colors.green[300],
                  img: AssetImage('assets/img/quimica.png'),
                  route: 'quimics',
                  title: 'Química',
                ),
              ),
              CourseTileWidget(
                CourseArguments(
                  color: Colors.purple[300],
                  img: AssetImage('assets/img/fisica.png'),
                  route: 'physics',
                  title: 'Física',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
