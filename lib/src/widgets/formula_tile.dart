import 'package:ezformulas/src/providers/_provider.dart';
import 'package:flutter/material.dart';

class FormulaTileWidget extends StatelessWidget {
  FormulaArguments settings;
  Color color;

  FormulaTileWidget({required this.settings, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final charTheme = Theme.of(context).textTheme;

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
              Text(settings.char,
                  style: charTheme.bodyText1!.copyWith(color: color)),
              Container(
                padding: EdgeInsets.only(left: h * 0.04),
                width: w * 0.6,
                child: Text(
                  settings.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: color),
                ),
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'formula', arguments: [settings, color]);
        },
      ),
    );
  }
}
