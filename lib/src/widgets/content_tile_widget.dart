import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ContentTileWidget extends StatelessWidget {
  final ContentArguments settings;

  ContentTileWidget({this.settings});

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
          backgroundColor: MaterialStateProperty.all(settings.color),
        ),
        child: Row(
          children: [
            Image(
              height: 80.0,
              image: settings.img,
              fit: BoxFit.cover,
            ),
            Container(
              width: 220,
              height: 120,
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: Text(
                settings.title,
                style: styles.course,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, settings.route, arguments: settings);
        },
      ),
    );
  }
}
