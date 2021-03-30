import 'package:flutter/material.dart';

class MathPage extends StatelessWidget {
  const MathPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: 40,
                image: AssetImage('assets/img/matematica.png'),
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
