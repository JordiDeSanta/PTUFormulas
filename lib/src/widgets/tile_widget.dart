import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class TileWidget extends StatelessWidget {
  final String courseName;
  final Color color;
  final String imageRoute;
  final String route;

  TileWidget(this.courseName, this.color, this.imageRoute, this.route);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Row(
          children: [
            Image(
              height: 80.0,
              image: AssetImage(imageRoute),
              fit: BoxFit.cover,
            ),
            Container(
              width: 220,
              height: 120,
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: Text(
                courseName,
                style: styles.course,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
