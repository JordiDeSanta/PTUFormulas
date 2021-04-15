import 'package:flutter/material.dart';

class FormulaButton extends StatelessWidget {
  const FormulaButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Container(width: 10, height: 10),
      ),
    );
  }
}
