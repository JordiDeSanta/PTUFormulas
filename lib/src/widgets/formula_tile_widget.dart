import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class FormulaTileWidget extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final Color cardColor;

  FormulaTileWidget({this.image, this.title, this.cardColor});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        color: cardColor,
        child: ExpansionTile(
          title: Text(title, style: styles.expansionTile),
          children: [Image(image: image)],
        ),
      ),
    );
  }
}
