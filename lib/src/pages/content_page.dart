import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/providers/ad_state.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/formula_tile_widget.dart';
import 'package:ptuformulas/src/widgets/app_bar_border.dart';

class ContentPage extends StatefulWidget {
  ContentPage({Key key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
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
          size: AdSize.mediumRectangle,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    Color bgColor = args[0];
    ContentArguments content = args[1];
    double size = MediaQuery.of(context).size.aspectRatio;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(content.title, style: styles.getCourse(context)),
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0.0,
          toolbarHeight: size * 140,
          foregroundColor: Colors.transparent,
          shape: const CurvedBorder(10.0),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: size * 90,
                image: content.img,
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
        body: ListView(
          children: createFormulas(content, size),
        ),
      ),
    );
  }

  List<Widget> createFormulas(ContentArguments args, double size) {
    double h = MediaQuery.of(context).size.height;

    List<Widget> contentTiles = [
      SizedBox(height: h * 0.01),
      if (banner == null)
        Container()
      else
        Container(
          height: h * 0.4,
          child: AdWidget(
            ad: banner,
          ),
        )
    ];

    args.formulas.formulas.forEach((key, value) {
      final tempTile = FormulaTileWidget(
        title: key,
        image: value[0],
        params: value[1],
        button: value[2],
        cardColor: args.ftColor,
        buttonColor: args.formulas.tilesColor,
      );

      contentTiles.add(tempTile);
    });

    return contentTiles;
  }
}
