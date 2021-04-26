import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/themes/colors_theme.dart';
import 'package:ptuformulas/src/widgets/course_tile_widget.dart';

class NewHomePage extends StatefulWidget {
  NewHomePage({Key key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final styles = TextStyles();
  final colors = ColorsTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PTU Fórmulas', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0),
            _createPhysics(),
          ],
        ),
      ),
    );
  }

  Widget _createPhysics() {
    return CourseTileWidget(
      CourseArguments(
        color: colors.physics[0],
        img: AssetImage('assets/img/fisica.png'),
        route: 'physics',
        title: 'Física',
        contentsColor: colors.physics[1],
        contents: [
          ContentArguments(
            img: AssetImage('assets/img/ondas.png'),
            route: 'p',
            title: 'Ondas',
            ftColor: colors.physics[2],
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Time(),
                      pageName: 'Periódo',
                      params: {
                        Param(
                          name: 'Tiempo Transcurrido',
                          med: Time(),
                        ): 1.0,
                        Param(
                          name: 'Número de Oscilaciones',
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double n = m.values.toList()[1];

                        return t / n;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['Hz'],
                      pageName: 'Frecuencia',
                      params: {
                        Param(
                          name: 'Número de Oscilaciones',
                        ): 1.0,
                        Param(
                          name: 'Tiempo Transcurrido',
                          med: Time(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputN = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double n = m.keys.toList()[0].getValue(inputN);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return n / t;
                      },
                    ),
                  ],
                ],
                'Longitud de Onda': [
                  AssetImage('assets/img/formulas/LdeOnda.PNG'),
                  AssetImage('assets/img/params/LdeOnda.PNG'),
                  [
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Longitud de Onda 1',
                      params: {
                        Param(
                          name: 'Longitud del Tren de Ondas',
                          med: Length(),
                        ): 1.0,
                        Param(
                          name: 'Número de Oscilaciones',
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL = m.values.toList()[0];

                        double l = m.keys.toList()[0].getValue(inputL);
                        double n = m.values.toList()[1];

                        return l / n;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Longitud de Onda 2',
                      params: {
                        Param(
                          name: 'Velocidad de Propagación',
                          med: VelocityU(),
                        ): 1.0,
                        Param(
                          name: 'Periódo',
                          med: Time(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double v = m.keys.toList()[0].getValue(inputV);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return v * t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Longitud de Onda 3',
                      params: {
                        Param(
                          name: 'Velocidad de Propagación',
                          med: VelocityU(),
                        ): 1.0,
                        Param(
                          name: 'Frecuencia',
                          med: Frecuency(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV = m.values.toList()[0];
                        double inputF = m.values.toList()[1];

                        double v = m.keys.toList()[0].getValue(inputV);
                        double f = m.keys.toList()[1].getValue(inputF);

                        return v / f;
                      },
                    ),
                  ]
                ],
                'Velocidad de Propagación': [
                  AssetImage('assets/img/formulas/VeldeProp.PNG'),
                  AssetImage('assets/img/params/VeldeProp.PNG'),
                  [
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad de Propagación 1',
                      params: {
                        Param(name: 'Distancia Recorrida', med: Length()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputD = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double d = m.keys.toList()[0].getValue(inputD);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return d / t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad de Propagación 2',
                      params: {
                        Param(name: 'Longitud de Onda', med: Length()): 1.0,
                        Param(name: 'Periódo', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double l = m.keys.toList()[0].getValue(inputL);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return l / t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad de Propagación 3',
                      params: {
                        Param(name: 'Longitud de Onda', med: Length()): 1.0,
                        Param(name: 'Frecuencia', med: Frecuency()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL = m.values.toList()[0];
                        double inputF = m.values.toList()[1];

                        double l = m.keys.toList()[0].getValue(inputL);
                        double f = m.keys.toList()[1].getValue(inputF);

                        return l * f;
                      },
                    ),
                  ]
                ],
              },
            ),
          ),
          /* ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/mru.png'),
            route: 'p',
            title: 'MRU',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Desplazamiento': [
                  AssetImage('assets/img/formulas/Desplazamiento.PNG'),
                  AssetImage('assets/img/params/Desplazamiento.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Desplazamiento',
                      params: {
                        Param(name: 'Posición Final', med: Length()): 1.0,
                        Param(name: 'Posición Inicial', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputx2 = m.values.toList()[0];
                        double inputx1 = m.values.toList()[1];

                        double x2 = m.keys.toList()[0].getValue(inputx2);
                        double x1 = m.keys.toList()[1].getValue(inputx1);

                        return x2 - x1;
                      },
                    ),
                  ],
                ],
                'Rapidez': [
                  AssetImage('assets/img/formulas/RapidezMRU.PNG'),
                  AssetImage('assets/img/params/VeldeProp.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Rapidez',
                      params: {
                        Param(name: 'Distancia Recorrida', med: Length()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputD = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double d = m.keys.toList()[0].getValue(inputD);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return d / t;
                      },
                    ),
                  ],
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRU.PNG'),
                  AssetImage('assets/img/params/VelocidadMRU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad',
                      params: {
                        Param(name: 'Desplazamiento', med: Length()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputD = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double d = m.keys.toList()[0].getValue(inputD);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return d / t;
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRU.PNG'),
                  AssetImage('assets/img/params/PosicionMRU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Posición',
                      params: {
                        Param(name: 'Posición Inicial', med: Length()): 1.0,
                        Param(name: 'Velocidad', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputx1 = m.values.toList()[0];
                        double inputV = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double x1 = m.keys.toList()[1].getValue(inputx1);
                        double v = m.keys.toList()[1].getValue(inputV);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return x1 + v * t;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/mruvh.png'),
            route: 'p',
            title: 'MRUV',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Aceleración': [
                  AssetImage('assets/img/formulas/AceleracionMRUV.PNG'),
                  AssetImage('assets/img/params/AceleracionMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m/s\u00B2'],
                      pageName: 'Aceleración',
                      params: {
                        Param(name: 'Velocidad Final', med: VelocityU()): 2.0,
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Final', med: Time()): 1.0,
                        Param(name: 'Tiempo Inicial', med: Time()): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad según Tiempo',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        return 0.0;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m/s'],
                      pageName: 'Velocidad Final',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Desplazamiento', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRUV.PNG'),
                  AssetImage('assets/img/params/PosicionMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Posición 1',
                      params: {
                        Param(name: 'Posición Inicial', med: Length()): 1.0,
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        return 0.0;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['m'],
                      pageName: 'Posición 2',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Velocidad Final', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        return 0.0;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          */
        ],
      ),
    );
  }
}
