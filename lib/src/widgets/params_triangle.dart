import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ParamsTriangle extends StatelessWidget {
  final Color color;
  ParamsTriangle({this.color});

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
        Transform.translate(
          offset: Offset(127, 140),
          child: Text(
            '0.512 N',
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
