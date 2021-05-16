import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/params_triangle.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptuformulas/src/providers/ad_state.dart';

class FormulaPage extends StatefulWidget {
  FormulaPage();

  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  final styles = TextStyles();

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.largeBanner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    Color pageColor = args[0];
    FormulaButtonArguments content = args[1];
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          content.pageName,
          style: styles.getCourse(context),
          overflow: TextOverflow.fade,
        ),
        centerTitle: true,
        toolbarHeight: height * 0.1,
        backgroundColor: pageColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        _createParams(content, pageColor),
        _result(content, pageColor),
        SizedBox(height: 20.0),
        if (banner == null)
          SizedBox(height: 80.0)
        else
          Container(
            height: 100,
            child: AdWidget(
              ad: banner,
            ),
          )
      ]),
    );
  }

  Widget _createParams(FormulaButtonArguments args, Color pageColor) {
    List<Widget> _params = [SizedBox(height: 20.0)];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    args.params.forEach(
      (key, value) {
        Widget _temp = Center(
          child: Column(
            children: [
              Container(
                width: width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pageColor),
                    ),
                    labelText: key.name,
                    labelStyle:
                        TextStyle(color: pageColor, fontSize: height * 0.02),
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
                  width: width * 0.8,
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
              style: styles.getResult(context),
            ),
            SizedBox(width: 10.0),
            if (args.resultUnit != null)
              DropdownButton(
                elevation: 1,
                items: _items(args.resultUnit),
                value: args.selectedResultUnit,
                onChanged: (v) {
                  setState(() {
                    args.selectedResultUnit = v;
                  });
                },
                style: TextStyle(color: pageColor),
              ),
            SizedBox(height: 10.0),
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
    double height = MediaQuery.of(context).size.height;

    args.mults.forEach((key, value) {
      final _tempItem = DropdownMenuItem(
        value: value,
        child: Text(
          key,
          style: TextStyle(fontSize: height * 0.015),
        ),
      );

      _tempList.add(_tempItem);
    });

    return _tempList;
  }
}
