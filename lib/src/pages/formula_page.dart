import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

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
        title: Text('Formula', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Column(
        children: _createParams(args),
      ),
    );
  }

  List<Widget> _createParams(FormulaButtonArguments args) {
    List<Widget> _params = [SizedBox(height: 10.0)];
    Map<String, int> newMap = args.params;

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
                    labelText: key,
                  ),
                  onChanged: (s) {
                    int v = int.parse(s);
                    args.params[key] = v;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        );
        _params.add(_temp);
      },
    );

    print(args.formula(newMap));

    return _params;
  }
}
