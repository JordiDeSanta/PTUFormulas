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
    final ContentArguments args = ModalRoute.of(context).settings.arguments;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(args.title, style: styles.course),
          centerTitle: true,
          backgroundColor: args.color,
          elevation: 0.0,
          toolbarHeight: 80.0,
          foregroundColor: Colors.transparent,
          shape: const CurvedBorder(10.0),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: 50.0,
                image: args.img,
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
        body: ListView(
          children: createFormulas(args),
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
        cardColor: args.formulas.cardColor,
      );

      contentTiles.add(tempTile);
    });

    return contentTiles;
  }
}
