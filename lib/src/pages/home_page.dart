import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/course_tile_widget.dart';

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
        /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),*/
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            createPhysics(),
          ],
        ),
      ),
    );
  }

  Widget createPhysics() {
    return CourseTileWidget(
      CourseArguments(
        color: Colors.purple[300],
        img: AssetImage('assets/img/fisica.png'),
        route: 'physics',
        title: 'Física',
        contents: [
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/ondas.png'),
            route: 'waves',
            title: 'Ondas',
            formulas: FormulaArguments(
              formulas: {
                'Velocidad': AssetImage('assets/img/ondas.png'),
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/magneto.png'),
            route: 'eandm',
            title: 'Electricidad y Magnetismo',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Ley de Coulomb': AssetImage('assets/img/ondas.png'),
              },
            ),
          ),
        ],
      ),
    );
  }
}
