import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ParamsTriangle extends StatelessWidget {
  final Color color;
  ParamsTriangle({
    this.color,
  });

  final TextStyles styles = new TextStyles();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          CupertinoIcons.triangle_fill,
          size: 400,
          color: color,
        ),
        Positioned(
          left: 137.0,
          top: 130.0,
          child: Text(
            '0.51 N',
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: 50,
          top: 280,
          child: Text(
            '1.56 Kg',
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: 200,
          top: 280,
          child: Text(
            '2.56 m/s\u00B2',
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
