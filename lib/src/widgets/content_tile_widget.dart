import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ContentTileWidget extends StatelessWidget {
  final ContentArguments settings;
  final Color color;

  ContentTileWidget({this.settings, this.color});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size * 10, horizontal: size * 10),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size * 40),
          child: Row(
            children: [
              Image(
                height: size * 180,
                image: settings.img,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: size * 40),
                width: size * 450,
                child: Text(
                  settings.title,
                  style: styles.getCourse(context),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, settings.route,
              arguments: [color, settings]);
        },
      ),
    );
  }
}
