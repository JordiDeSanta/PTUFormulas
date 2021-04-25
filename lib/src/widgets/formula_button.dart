import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';

class FormulaButton extends StatelessWidget {
  final FormulaButtonArguments args;
  final Color tileColor;

  const FormulaButton({this.args, this.tileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(tileColor),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'formula', arguments: [tileColor, args]);
        },
        child: Container(
          width: double.infinity,
          height: 15,
          child: Text(
            'Calcular ' + args.pageName,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
