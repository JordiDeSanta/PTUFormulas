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
    final multList = args.params.keys.toList();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Icon(
          CupertinoIcons.triangle_fill,
          size: width * 1.1,
          color: args.triangleColor,
        ),
        Positioned(
          left: width * 0.34,
          top: height * 0.18,
          child: Text(
            paramsList[0] != 0.0
                ? (paramsList[0] * multList[0].selectedMed)
                        .toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[0]
                : args.formula(args.params).toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[0],
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: width * 0.1,
          top: height * 0.4,
          child: Text(
            paramsList[1] != 0
                ? (paramsList[1] * multList[1].selectedMed)
                        .toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[1]
                : args.formula(args.params).toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[1],
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: width * 0.55,
          top: height * 0.4,
          child: Text(
            paramsList[2] != 0
                ? (paramsList[2] * multList[2].selectedMed)
                        .toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[2]
                : args.formula(args.params).toStringAsPrecision(3) +
                    ' ' +
                    args.resultsSystem[2],
            style: styles.triangle,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: width * 0.25,
          top: height * 0.28,
          child: Text(
            'Define como 0 el valor\n que quieras calcular',
            style: styles.result.copyWith(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
