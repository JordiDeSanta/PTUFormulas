import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/formula_button.dart';

class FormulaTileWidget extends StatelessWidget {
  final ImageProvider image;
  final ImageProvider params;
  final List<FormulaButtonArguments> button;
  final String title;
  final Color cardColor;
  final Color buttonColor;

  FormulaTileWidget({
    this.image,
    this.title,
    this.cardColor,
    this.params,
    this.button,
    this.buttonColor,
  });

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;

    return Padding(
      padding:
          EdgeInsets.only(bottom: size * 20, left: size * 10, right: size * 10),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: cardColor,
        child: Padding(
          padding: EdgeInsets.only(left: size * 10),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.all(5.0),
            title: Text(title, style: styles.getET(context)),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Column(
                  children: [
                    _createFormulas(),
                    SizedBox(height: size * 8),
                    _createParams(),
                    Column(
                      children: _buttons(buttonColor, size),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createFormulas() {
    if (image != null) {
      return Container(
        width: double.infinity,
        child: Image(
          image: image,
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _createParams() {
    if (params != null) {
      return Container(
        width: double.infinity,
        child: Image(
          image: params,
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> _buttons(Color color, double size) {
    List<Widget> buttons = [
      SizedBox(
        height: size * 5,
      )
    ];

    button.forEach((b) {
      final _temp = FormulaButton(
        args: b,
        tileColor: color,
      );
      buttons.add(_temp);
    });

    return buttons;
  }
}
