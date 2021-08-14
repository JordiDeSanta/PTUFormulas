import 'package:ezformulas/src/providers/_provider.dart';
import 'package:flutter/material.dart';

class ContentTileWidget extends StatelessWidget {
  ContentArguments settings;
  Color color;

  ContentTileWidget({required this.settings, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          EdgeInsets.only(left: w * 0.025, right: w * 0.025, bottom: h * 0.025),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(colorScheme.primary),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: h * 0.03),
          child: Row(
            children: [
              Icon(settings.icon, color: color),
              Container(
                padding: EdgeInsets.only(left: w * 0.04),
                width: w * 0.6,
                child: Text(
                  settings.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: color),
                ),
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'content', arguments: [settings, color]);
        },
      ),
    );
  }
}
