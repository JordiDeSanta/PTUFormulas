import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/ad_state.dart';
import 'package:ezformulas/src/providers/utils.dart' as utils;
import 'package:ezformulas/src/widgets/content_tile.dart';
import 'package:ezformulas/src/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: colorScheme.background,
      systemNavigationBarDividerColor: colorScheme.background,
    ));

    double h = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as CourseArguments;

    return Container(
      child: Scaffold(
        floatingActionButton: FloatingButton(Alignment(1.5, 0)),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: h * 0.1,
          actions: [],
          title: Text(
            args.title,
            style:
                TextStyle(color: utils.colors[args.title], fontSize: h * 0.05),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView(
            children: _createTiles(args, utils.colors[args.title]!, h),
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

  List<Widget> _createTiles(CourseArguments args, Color color, double h) {
    List<Widget> contentTiles = [SizedBox(height: h * 0.025)];

    for (var content in args.contents) {
      final tempTile = ContentTileWidget(
        settings: content,
        color: color,
      );

      contentTiles.add(tempTile);
    }

    return contentTiles;
  }
}
