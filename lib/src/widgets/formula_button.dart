import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';

class FormulaButton extends StatelessWidget {
  final FormulaButtonArguments args;

  const FormulaButton({this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(Colors.purple[200]),
        ),
        onPressed: () {
          print(args.formula([2, 1]));
        },
        child: Container(
          width: double.infinity,
          height: 15,
          child: Text(
            'Calcular',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
