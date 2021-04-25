import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/formula_tile_widget.dart';
import 'package:ptuformulas/src/widgets/app_bar_border.dart';

class ContentPage extends StatelessWidget {
  final styles = TextStyles();

  ContentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List args = ModalRoute.of(context).settings.arguments;
    Color bgColor = args[0];
    ContentArguments content = args[1];

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(content.title, style: styles.course),
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0.0,
          toolbarHeight: 80.0,
          foregroundColor: Colors.transparent,
          shape: const CurvedBorder(10.0),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: 50.0,
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
          children: createFormulas(content),
        ),
      ),
    );
  }

  List<Widget> createFormulas(ContentArguments args) {
    List<Widget> contentTiles = [SizedBox(height: 10.0)];

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
