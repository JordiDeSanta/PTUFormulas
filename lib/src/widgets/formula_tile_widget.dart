import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class FormulaTileWidget extends StatelessWidget {
  final ImageProvider image;
  final String title;

  FormulaTileWidget({this.image, this.title});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ExpansionTile(
        title: Text(title),
      ),
    );
  }
}
