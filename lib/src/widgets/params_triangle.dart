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
        Container(
          alignment: Alignment.center,
          child: Icon(
            CupertinoIcons.triangle_fill,
            color: args.triangleColor,
            size: width * 1.1,
          ),
        ),
        Column(
          children: [
            SizedBox(height: width * height * 0.0004),
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
            SizedBox(height: height * 0.06),
            Container(
              width: width * 0.5,
              child: Text(
                'Define como 0 el valor que quieras calcular',
                style: styles
                    .getResult(context)
                    .copyWith(color: Colors.white, fontSize: height * 0.03),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.07),
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
                SizedBox(width: width * 0.2),
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
