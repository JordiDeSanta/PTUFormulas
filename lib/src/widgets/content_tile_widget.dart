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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
          padding: EdgeInsets.symmetric(vertical: height * 0.025),
          child: Row(
            children: [
              Image(
                height: height * 0.12,
                image: settings.img,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: width * 0.06),
                width: width * 0.6,
                child: Text(
                  settings.title,
                  style: styles.course,
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
