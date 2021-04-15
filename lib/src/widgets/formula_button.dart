import 'package:flutter/material.dart';

class FormulaButton extends StatelessWidget {
  const FormulaButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(Colors.purple[200]),
        ),
        onPressed: () {},
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
