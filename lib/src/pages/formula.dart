import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/ad_state.dart';
import 'package:ezformulas/src/providers/units.dart';
import 'package:ezformulas/src/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class FormulaPage extends StatefulWidget {
  FormulaPage();

  @override
  _FormulaPageState createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    FormulaArguments formula = args[0];
    Color color = args[1];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingButton(Alignment(h * 0.0022, 0)),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: color,
        ),
        elevation: 0.0,
        title: Text(
          formula.name,
          overflow: TextOverflow.fade,
          style: TextStyle(color: color, fontSize: h * 0.05),
        ),
        centerTitle: true,
        toolbarHeight: h * 0.1,
      ),
      body: ListView(
        children: [
          if (formula.svgRoute != null) _drawSvg(h, w, formula, color),
          if (formula.imgRoute != null) _drawImg(h, w, formula, color),
          if (formula.formula != null) _createParams(formula, color),
          if (formula.formula != null) _result(formula, color, h),
          Container(height: h * 0.1),
        ],
      ),
      bottomSheet: Stack(
        children: [
          if (banner == null)
            Container()
          else
            Container(
              height: h * 0.1,
              child: AdWidget(
                ad: banner!,
              ),
            )
        ],
      ),
    );
  }

  Widget _drawSvg(double h, double w, FormulaArguments f, Color c) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.035),
      child: SvgPicture.asset(
        f.svgRoute!,
        color: c,
        fit: BoxFit.contain,
        width: w * 0.8,
        allowDrawingOutsideViewBox: true,
        placeholderBuilder: (c) {
          return Image.asset('assets/formulas/loading.gif');
        },
      ),
    );
  }

  Widget _drawImg(double h, double w, FormulaArguments f, Color c) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.035, horizontal: w * 0.035),
      child: Image.asset(
        f.imgRoute!,
        color: c,
        fit: BoxFit.contain,
        width: w * 0.8,
      ),
    );
  }

  Widget _createParams(FormulaArguments args, Color color) {
    List<Widget> _params = [SizedBox(height: 20.0)];
    double size = MediaQuery.of(context).size.aspectRatio;
    double w = MediaQuery.of(context).size.width;

    args.params!.forEach(
      (key, value) {
        Widget _temp = Center(
          child: Column(
            children: [
              Container(
                width: w * 0.8,
                child: TextField(
                  style: TextStyle(color: color),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                    ),
                    labelText: key.name,
                    labelStyle: TextStyle(color: color, fontSize: size * 30),
                  ),
                  onChanged: (s) {
                    if (s == '') {
                      setState(() {
                        args.params![key] = 0.0;
                      });
                    } else {
                      setState(() {
                        double v = double.parse(s);
                        args.params![key] = v;
                      });
                    }
                  },
                ),
              ),
              if (key.med != null)
                Container(
                  width: w * 0.8,
                  height: size * 100,
                  child: DropdownButton(
                    items: _items(key.med!, size),
                    value: key.selectedMed,
                    onChanged: (v) {
                      setState(() {
                        key.selectedMed = v as double;
                      });
                    },
                    style: TextStyle(color: color),
                  ),
                ),
              SizedBox(height: size * 40),
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

  Widget _result(FormulaArguments args, Color color, double h) {
    Widget _result;

    _result = Container(
      padding: EdgeInsets.only(top: h * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Resultado: ' +
                (args.formula!(args.params!) / args.selectedResultUnit)
                    .toString(),
            style: TextStyle(color: color),
          ),
          SizedBox(width: h * 0.1),
          if (args.resultUnit != null)
            DropdownButton(
              elevation: 1,
              items: _items(args.resultUnit!, h),
              value: args.selectedResultUnit,
              onChanged: (v) {
                setState(() {
                  args.selectedResultUnit = v as double;
                });
              },
              style: TextStyle(color: color),
            ),
          SizedBox(height: h * 0.1),
        ],
      ),
    );

    return _result;
  }

  List<DropdownMenuItem<double>> _items(Unit args, double h) {
    final _tempList = <DropdownMenuItem<double>>[];

    args.mults.forEach((key, value) {
      final _tempItem = DropdownMenuItem<double>(
        value: value,
        child: Text(
          key,
        ),
      );

      _tempList.add(_tempItem);
    });

    return _tempList;
  }
}
