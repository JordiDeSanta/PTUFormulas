import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';

class ContentPage extends StatelessWidget {
  final styles = TextStyles();

  ContentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContentArguments args = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(args.title, style: styles.course),
          centerTitle: true,
          backgroundColor: args.color,
          elevation: 0.0,
          toolbarHeight: 80.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: 40,
                image: args.img,
              ),
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListWheelScrollView(
            itemExtent: args.contentImgs.length.toDouble(),
            children: createFormulas(),
          ),
        ),
      ),
    );
  }

  List<Widget> createFormulas(ContentArguments args) {
    List<Widget> contentTiles = [SizedBox(height: 10.0)];

    for (var content in args.contentImgs) {
      final tempTile = ExpansionTile();

      contentTiles.add(tempTile);
    }

    return contentTiles;
  }
}
