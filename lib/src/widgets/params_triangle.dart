import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ParamsTriangle extends StatelessWidget {
  final FormulaButtonArguments args;

  ParamsTriangle({
    this.args,
  });

  final TextStyles styles = new TextStyles();

  @override
  Widget build(BuildContext context) {
    final paramsList = args.params.values.toList();

    return Stack(
      children: [
        Icon(
          CupertinoIcons.triangle_fill,
          size: 400,
          color: args.pageColor,
        ),
        Positioned(
          left: 137.0,
          top: 130.0,
          child: Text(
            paramsList[0] != 0
                ? paramsList[0].toString() + ' ' + args.resultsSystem[0]
                : args.formula.toString(),
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: 50,
          top: 280,
          child: Text(
            paramsList[1] != 0
                ? paramsList[1].toString() + ' ' + args.resultsSystem[1]
                : args.formula.toString(),
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: 200,
          top: 280,
          child: Text(
            paramsList[2] != 0
                ? paramsList[2].toString() + ' ' + args.resultsSystem[2]
                : args.formula.toString(),
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
