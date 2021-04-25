import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart'
    show FormulaButtonArguments;
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/params_triangle.dart';
import 'package:input_calculator/input_calculator.dart';

class FormulaPage extends StatefulWidget {
  FormulaPage();

  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  final styles = TextStyles();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FormulaButtonArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.pageName, style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: args.pageColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: ListView(children: [
        _createParams(args),
        _result(args),
      ]),
    );
  }

  Widget _createParams(FormulaButtonArguments args) {
    List<Widget> _params = [SizedBox(height: 20.0)];

    args.params.forEach(
      (key, value) {
        value = 1.0;
        Widget _temp = Center(
          child: Column(
            children: [
              Container(
                width: 250.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: args.pageColor),
                    ),
                    labelText: key.name,
                    labelStyle: TextStyle(color: args.pageColor),
                  ),
                  onChanged: (s) {
                    if (s == '') {
                      setState(() {
                        args.params[key] = 0.0;
                      });
                    } else {
                      setState(() {
                        double v = double.parse(s);
                        args.params[key] = v;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        );
        _params.add(_temp);
      },
    );

    return Column(
      children: _params,
    );
  }

  Widget _result(FormulaButtonArguments args) {
    Widget _result;

    if (!args.bIsTriangle) {
      _result = Center(
        child: Text(
          'Resultado: ' +
              args.formula(args.params).toString() +
              " " +
              args.resultsSystem[0],
        ),
      );
    } else {
      _result = Center(
        child: ParamsTriangle(
          args: args,
        ),
      );
    }

    return _result;
  }
}
