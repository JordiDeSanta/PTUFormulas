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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.all(5.0),
            title: Text(title, style: styles.expansionTile),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Column(
                  children: [
                    _createFormulas(),
                    _createParams(),
                    Column(
                      children: _buttons(buttonColor),
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
      return Column(
        children: [
          Image(image: image),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _createParams() {
    if (params != null) {
      return Column(
        children: [
          SizedBox(height: 5.0),
          Image(image: params),
        ],
      );
    } else {
      return Container();
    }
  }

  List<Widget> _buttons(Color color) {
    List<Widget> buttons = [SizedBox(height: 5.0)];

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
