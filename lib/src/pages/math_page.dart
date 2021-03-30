import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class MathPage extends StatelessWidget {
  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Matemática', style: styles.course),
          centerTitle: true,
          backgroundColor: Colors.blue[300],
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
                image: AssetImage('assets/img/matematica.png'),
                color: Colors.white,
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
