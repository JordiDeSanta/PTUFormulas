import 'package:ezformulas/src/providers/ad_state.dart';
import 'package:ezformulas/src/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

    return Scaffold(
      floatingActionButton: FloatingButton(Alignment.center),
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
