import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/tile_widget.dart';

class PhysicsPage extends StatelessWidget {
  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Física', style: styles.course),
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
                  Colors.purple[200],
                  'assets/img/ondas.png',
                  'math',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
