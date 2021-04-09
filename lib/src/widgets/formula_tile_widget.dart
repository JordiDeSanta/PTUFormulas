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
      padding: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.all(5.0),
            title: Text(title, style: styles.expansionTile),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: image,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
