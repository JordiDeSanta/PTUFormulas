import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/ad_state.dart';
import 'package:ezformulas/src/widgets/formula_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  ContentPage();

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  BannerAd? banner;

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
    final colorScheme = Theme.of(context).colorScheme;

    final args = ModalRoute.of(context)!.settings.arguments as List;
    ContentArguments content = args[0];
    Color color = args[1];

    double h = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: color,
          ),
          title: Text(
            content.title,
            style: TextStyle(color: color, fontSize: h * 0.05),
            overflow: TextOverflow.fade,
          ),
          toolbarHeight: h * 0.1,
          foregroundColor: Colors.transparent,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView(
            children: createFormulas(content, color, h),
          ),
        ),
        bottomSheet: Stack(
          children: [
            if (banner == null)
              Container()
            else
              Container(
                height: h * 0.2,
                child: AdWidget(
                  ad: banner!,
                ),
              )
          ],
        ),
      ),
    );
  }

  List<Widget> createFormulas(ContentArguments args, Color color, double h) {
    List<Widget> contentTiles = [SizedBox(height: h * 0.025)];

    args.formulas.forEach((f) {
      final _temp = FormulaTileWidget(settings: f, color: color);
      contentTiles.add(_temp);
    });

    contentTiles.add(SizedBox(height: h * 0.2));

    return contentTiles;
  }
}
