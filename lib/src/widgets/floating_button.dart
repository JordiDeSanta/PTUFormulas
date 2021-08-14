import 'package:ezformulas/src/courses/math.dart';
import 'package:ezformulas/src/courses/physics.dart';
import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/utils.dart' as utils;
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FloatingButton extends StatelessWidget {
  Alignment alignment;

  FloatingButton(this.alignment);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    double w = MediaQuery.of(context).size.width;

    return FabCircularMenu(
      fabSize: w * 0.28,
      fabOpenIcon:
          Icon(LineIcons.brain, color: Colors.pink[300], size: w * 0.15),
      fabCloseIcon:
          Icon(LineIcons.brain, color: Colors.pink[300], size: w * 0.15),
      ringDiameter: w * 0.8,
      ringWidth: w * 0.2,
      ringColor: colorScheme.primary,
      alignment: alignment,
      children: <Widget>[
        RawMaterialButton(
          child: Icon(
            LineIcons.infinity,
            size: w * 0.1,
            color: utils.colors['Matemáticas'],
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'course', arguments: math);
          },
        ),
        RawMaterialButton(
          child: Icon(
            LineIcons.flask,
            size: w * 0.1,
            color: utils.colors['Química'],
          ),
          onPressed: () {},
        ),
        RawMaterialButton(
          child: Icon(
            LineIcons.atom,
            size: w * 0.1,
            color: utils.colors['Física'],
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'course', arguments: physics);
          },
        ),
      ],
    );
  }
}
