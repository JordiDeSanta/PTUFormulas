import 'package:flutter/material.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/tile_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PTU Fórmulas', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              TileWidget(
                'Matemática',
                Colors.blue[300],
                'assets/img/matematica.png',
                'math',
              ),
              TileWidget(
                'Física',
                Colors.purple[300],
                'assets/img/fisica.png',
                'math',
              ),
              TileWidget(
                'Química',
                Colors.green[300],
                'assets/img/quimica.png',
                'math',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
