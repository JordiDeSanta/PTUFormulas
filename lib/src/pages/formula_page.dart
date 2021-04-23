import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart'
    show FormulaButtonArguments;
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/params_triangle.dart';

class FormulaPage extends StatefulWidget {
  FormulaPage();

  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  final styles = TextStyles();

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
      body: ListView(
        children: _createParams(args),
      ),
    );
  }

  List<Widget> _createParams(FormulaButtonArguments args) {
    List<Widget> _params = [SizedBox(height: 20.0)];
    Map<String, double> newMap = args.params;

    args.params.forEach(
      (key, value) {
        Widget _temp = Center(
          child: Column(
            children: [
              Container(
                width: 250.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: args.pageColor)),
                    labelText: key,
                    labelStyle: TextStyle(color: args.pageColor),
                  ),
                  onChanged: (s) {
                    if (s == '') {
                      args.params[key] = 0.0;
                      setState(() {});
                    } else {
                      double v = double.parse(s);
                      args.params[key] = v;
                      setState(() {});
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

    _params.add(
      SizedBox(
        height: 10.0,
      ),
    );

    if (!args.bIsTriangle) {
      _params.add(
        Center(
          child: Text('Resultado: ' +
              args.formula(newMap).toString() +
              " " +
              args.resultsSystem[0]),
        ),
      );
    } else {
      _params.add(
        Center(
          child: ParamsTriangle(
            color: Colors.deepPurple,
          ),
        ),
      );
    }

    return _params;
  }
}
