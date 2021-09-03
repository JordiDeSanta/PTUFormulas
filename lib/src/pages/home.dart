import 'package:ezformulas/src/courses/math.dart';
import 'package:ezformulas/src/courses/physics.dart';
import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/ad_state.dart';
import 'package:ezformulas/src/providers/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.mediumRectangle,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: w * 0.3,
            top: h * 0.28,
            child: _button(math, context, LineIcons.infinity,
                utils.colors['Matemáticas'], h),
          ),
          Positioned(
            left: w * 0.48,
            top: h * 0.43,
            child: _button(
                physics, context, LineIcons.atom, utils.colors['Física'], h),
          ),
          Positioned(
            left: w * 0.12,
            top: h * 0.43,
            child: _button(
                math, context, LineIcons.flask, utils.colors['Química'], h),
          ),
        ],
      ),
      bottomSheet: Stack(
        children: [
          if (banner == null)
            Container()
          else
            Container(
              height: h * 0.4,
              child: AdWidget(
                ad: banner!,
              ),
            )
        ],
      ),
    );
  }
}

Widget _button(
    CourseArguments ca, BuildContext c, IconData id, Color? co, double h) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(c, 'course', arguments: ca);
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all(CircleBorder()),
    ),
    child: Padding(
      padding: EdgeInsets.all(h * 0.025),
      child: Icon(id, color: co, size: h * 0.1),
    ),
  );
}
