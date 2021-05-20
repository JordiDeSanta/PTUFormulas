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

    double size = MediaQuery.of(context).size.aspectRatio;

    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Icon(
            CupertinoIcons.triangle_fill,
            color: args.triangleColor,
            size: size * 800,
          ),
        ),
        Column(
          children: [
            SizedBox(height: size * 200),
            Text(
              paramsList[0] != 0.0
                  ? (paramsList[0] * multList[0].selectedMed)
                          .toStringAsPrecision(3) +
                      ' ' +
                      args.resultsSystem[0]
                  : args.formula(args.params).toStringAsPrecision(3) +
                      ' ' +
                      args.resultsSystem[0],
              style: styles.getTriangle(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size * 130),
            Container(
              width: size * 300,
              child: Text(
                'Define como 0 el valor que quieras calcular',
                style: styles
                    .getResult(context)
                    .copyWith(color: Colors.white, fontSize: size * 30),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size * 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  paramsList[1] != 0
                      ? (paramsList[1] * multList[1].selectedMed)
                              .toStringAsPrecision(3) +
                          ' ' +
                          args.resultsSystem[1]
                      : args.formula(args.params).toStringAsPrecision(3) +
                          ' ' +
                          args.resultsSystem[1],
                  style: styles.getTriangle(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: size * 200),
                Text(
                  paramsList[2] != 0
                      ? (paramsList[2] * multList[2].selectedMed)
                              .toStringAsPrecision(3) +
                          ' ' +
                          args.resultsSystem[2]
                      : args.formula(args.params).toStringAsPrecision(3) +
                          ' ' +
                          args.resultsSystem[2],
                  style: styles.getTriangle(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
