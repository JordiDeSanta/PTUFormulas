import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/content_tile_widget.dart';
import 'package:ptuformulas/src/widgets/app_bar_border.dart';

class CoursePage extends StatelessWidget {
  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    final CourseArguments args = ModalRoute.of(context).settings.arguments;
    double size = MediaQuery.of(context).size.aspectRatio;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(args.title, style: styles.getCourse(context)),
          centerTitle: true,
          backgroundColor: args.color,
          elevation: 0.0,
          toolbarHeight: size * 140,
          shape: const CurvedBorder(10.0),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image(
                width: size * 90,
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
          child: SingleChildScrollView(
            child: Column(
              children: _createTiles(args, size),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _createTiles(CourseArguments args, double size) {
    List<Widget> contentTiles = [SizedBox(height: size * 20)];

    for (var content in args.contents) {
      final tempTile = ContentTileWidget(
        settings: content,
        color: args.contentsColor,
      );

      contentTiles.add(tempTile);
    }

    return contentTiles;
  }
}
