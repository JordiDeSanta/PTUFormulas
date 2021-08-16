import 'package:ezformulas/src/courses/math.dart';
import 'package:ezformulas/src/courses/physics.dart';
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
    double h = MediaQuery.of(context).size.height;

    return FabCircularMenu(
      fabSize: h * 0.15,
      fabOpenIcon:
          Icon(LineIcons.brain, color: Colors.pink[300], size: h * 0.1),
      fabCloseIcon:
          Icon(LineIcons.brain, color: Colors.pink[300], size: h * 0.1),
      ringDiameter: h * 0.35,
      ringWidth: h * 0.075,
      ringColor: colorScheme.primary,
      alignment: alignment,
      children: <Widget>[
        RawMaterialButton(
          child: Icon(
            LineIcons.infinity,
            size: h * 0.05,
            color: utils.colors['Matemáticas'],
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'course', arguments: math);
          },
        ),
        RawMaterialButton(
          child: Icon(
            LineIcons.flask,
            size: h * 0.05,
            color: utils.colors['Química'],
          ),
          onPressed: () {},
        ),
        RawMaterialButton(
          child: Icon(
            LineIcons.atom,
            size: h * 0.05,
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
