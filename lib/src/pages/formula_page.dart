import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    Color pageColor = args[0];
    FormulaButtonArguments content = args[1];

    return Scaffold(
      appBar: AppBar(
        title: Text(content.pageName, style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: pageColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: ListView(children: [
        _createParams(content, pageColor),
        _result(content, pageColor),
      ]),
    );
  }

  Widget _createParams(FormulaButtonArguments args, Color pageColor) {
    List<Widget> _params = [SizedBox(height: 20.0)];

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
                      borderSide: BorderSide(color: pageColor),
                    ),
                    labelText: key.name,
                    labelStyle: TextStyle(color: pageColor),
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
              if (key.med != null)
                Container(
                  width: 250.0,
                  height: 50.0,
                  child: DropdownButton(
                    items: _items(key.med),
                    value: key.selectedMed,
                    onChanged: (v) {
                      setState(() {
                        key.selectedMed = v;
                      });
                    },
                    style: TextStyle(color: pageColor),
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

  Widget _result(FormulaButtonArguments args, Color pageColor) {
    Widget _result;

    if (!args.bIsTriangle) {
      _result = Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'R: ' +
                  (args.formula(args.params) / args.selectedResultUnit)
                      .toString(),
              style: styles.result,
            ),
            SizedBox(width: 10.0),
            if (args.resultUnit != null)
              DropdownButton(
                items: _items(args.resultUnit),
                value: args.selectedResultUnit,
                onChanged: (v) {
                  setState(() {
                    args.selectedResultUnit = v;
                  });
                },
                style: TextStyle(color: pageColor),
              ),
          ],
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

  List<DropdownMenuItem> _items(Unit args) {
    final _tempList = <DropdownMenuItem>[];

    args.mults.forEach((key, value) {
      final _tempItem = DropdownMenuItem(
        value: value,
        child: Text(key),
      );

      _tempList.add(_tempItem);
    });

    return _tempList;
  }
}
