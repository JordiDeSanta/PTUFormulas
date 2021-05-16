import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class FormulaButton extends StatelessWidget {
  final FormulaButtonArguments args;
  final Color tileColor;

  FormulaButton({this.args, this.tileColor});

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(tileColor),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'formula', arguments: [tileColor, args]);
        },
        child: Container(
          padding: EdgeInsets.all(5),
          width: double.infinity,
          height: height * 0.04,
          child: Text(
            'Calcular ' + args.pageName,
            textAlign: TextAlign.start,
            style: styles.getResult(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
