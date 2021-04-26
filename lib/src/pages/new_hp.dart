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
                      resultUnit: Frecuency(),
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
                      resultUnit: Length(),
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
                      resultUnit: Length(),
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
                      resultUnit: Length(),
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
                      resultUnit: VelocityU(),
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
                      resultUnit: VelocityU(),
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
                      resultUnit: VelocityU(),
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
          ContentArguments(
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
                      resultUnit: Length(),
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
                      resultUnit: VelocityU(),
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
                      resultUnit: VelocityU(),
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
                      resultUnit: Length(),
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
                      resultUnit: Aceleration(),
                      pageName: 'Aceleración',
                      params: {
                        Param(name: 'Velocidad Final', med: VelocityU()): 2.0,
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Final', med: Time()): 1.0,
                        Param(name: 'Tiempo Inicial', med: Time()): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputVF = m.values.toList()[0];
                        double inputV0 = m.values.toList()[1];
                        double inputTF = m.values.toList()[2];
                        double inputT0 = m.values.toList()[3];

                        double vf = m.keys.toList()[0].getValue(inputVF);
                        double v0 = m.keys.toList()[1].getValue(inputV0);
                        double tf = m.keys.toList()[2].getValue(inputTF);
                        double t0 = m.keys.toList()[3].getValue(inputT0);

                        return (vf - v0) / (tf - t0);
                      },
                    ),
                  ],
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad según Tiempo',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputA = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double a = m.keys.toList()[1].getValue(inputA);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return v0 + a * t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad Final',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Desplazamiento', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputA = m.values.toList()[1];
                        double inputX = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double a = m.keys.toList()[1].getValue(inputA);
                        double x = m.keys.toList()[2].getValue(inputX);

                        return sqrt(pow(v0, 2) + 2 * a * x);
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRUV.PNG'),
                  AssetImage('assets/img/params/PosicionMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Posición 1',
                      params: {
                        Param(name: 'Posición Inicial', med: Length()): 1.0,
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Aceleración', med: Aceleration()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputX0 = m.values.toList()[0];
                        double inputV0 = m.values.toList()[1];
                        double inputA = m.values.toList()[2];
                        double inputT = m.values.toList()[3];

                        double x0 = m.keys.toList()[0].getValue(inputX0);
                        double v0 = m.keys.toList()[1].getValue(inputV0);
                        double a = m.keys.toList()[2].getValue(inputA);
                        double t = m.keys.toList()[3].getValue(inputT);

                        return x0 + v0 * t + ((a * pow(t, 2)) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Posición 2',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Velocidad Final', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputVF = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double vf = m.keys.toList()[1].getValue(inputVF);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return ((v0 + vf) / 2) * t;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/mruvv.png'),
            route: 'p',
            title: 'Caída Libre',
            ftColor: colors.physics[2],
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUVV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad según Tiempo',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return v0 + g * t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad Final',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputH = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double h = m.keys.toList()[2].getValue(inputH);

                        return sqrt(pow(v0, 2) + 2 * g * h);
                      },
                    ),
                  ],
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaMRUVV.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Altura 1',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return v0 * t + ((g * pow(t, 2)) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Altura 2',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Velocidad Final', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputVF = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double vf = m.keys.toList()[1].getValue(inputVF);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return ((v0 + vf) / 2) * t;
                      },
                    ),
                  ],
                ],
                'Tiempo de Caída': [
                  AssetImage('assets/img/formulas/TiempoMRUVV.PNG'),
                  AssetImage('assets/img/params/TiempoMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Time(),
                      pageName: 'Tiempo de Caída',
                      params: {
                        Param(name: 'Tiempo Final', med: Time()): 1.0,
                        Param(name: 'Tiempo Inicial', med: Time()): 0.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                      },
                      formula: (Map<Param, double> m) {
                        double inputTF = m.values.toList()[0];
                        double inputT0 = m.values.toList()[1];
                        double inputG = m.values.toList()[2];

                        double tf = m.keys.toList()[0].getValue(inputTF);
                        double t0 = m.keys.toList()[1].getValue(inputT0);
                        double g = m.keys.toList()[2].getValue(inputG);

                        return (tf - t0) / g;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/vert.png'),
            route: 'p',
            title: 'Tiro Vertical',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadUP.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad según Tiempo',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return v0 - g * t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Final',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputH = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double h = m.keys.toList()[2].getValue(inputH);

                        return sqrt(pow(v0, 2) - 2 * g * h);
                      },
                    ),
                  ],
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaUP.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Altura 1',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return v0 * t - ((g * pow(t, 2)) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Altura 2',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Velocidad Final', med: VelocityU()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputVF = m.values.toList()[1];
                        double inputT = m.values.toList()[2];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double vf = m.keys.toList()[1].getValue(inputVF);
                        double t = m.keys.toList()[2].getValue(inputT);

                        return ((v0 - vf) / 2) * t;
                      },
                    ),
                  ],
                ],
                'Velocidad Inicial': [
                  AssetImage('assets/img/formulas/Velocidad0UP.PNG'),
                  AssetImage('assets/img/params/Velocidad0UP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad Inicial',
                      params: {
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                        Param(name: 'Altura Máxima', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputG = m.values.toList()[0];
                        double inputHM = m.values.toList()[1];

                        double g = m.keys.toList()[0].getValue(inputG);
                        double hmax = m.keys.toList()[1].getValue(inputHM);

                        return sqrt(2 * g * hmax);
                      },
                    ),
                  ],
                ],
                'Altura Máxima': [
                  AssetImage('assets/img/formulas/AlturaMAX.PNG'),
                  AssetImage('assets/img/params/AlturaMAX.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Length(),
                      pageName: 'Altura Máxima',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);

                        return pow(v0, 2) / (2 * g);
                      },
                    ),
                  ],
                ],
                'Tiempo de Subida': [
                  AssetImage('assets/img/formulas/TiempoUP.PNG'),
                  AssetImage('assets/img/params/TiempoUP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Time(),
                      pageName: 'Tiempo de Subida',
                      params: {
                        Param(name: 'Velocidad Inicial', med: VelocityU()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputG = m.values.toList()[1];

                        double v0 = m.keys.toList()[0].getValue(inputV0);
                        double g = m.keys.toList()[1].getValue(inputG);

                        return v0 / g;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/fuerzas.png'),
            route: 'p',
            title: 'Fuerzas',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Fuerza': [
                  AssetImage('assets/img/formulas/Fuerza.PNG'),
                  AssetImage('assets/img/params/Fuerza.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['N', 'Kg', 'm/s\u00B2'],
                      bIsTriangle: true,
                      pageName: 'Fuerza',
                      params: {
                        Param(name: 'Fuerza'): 0,
                        Param(name: 'Masa', med: Mass()): 0,
                        Param(name: 'Aceleración', med: Aceleration()): 0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputM = m.values.toList()[1];
                        double inputA = m.values.toList()[2];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double ma = m.keys.toList()[1].getValue(inputM);
                        double a = m.keys.toList()[2].getValue(inputA);

                        if (f == 0) return ma * a;
                        if (ma == 0) return f / a;
                        if (a == 0) return f / ma;
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Peso y Normal': [
                  AssetImage('assets/img/formulas/PesoNormal.PNG'),
                  AssetImage('assets/img/params/PesoNormal.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      bIsTriangle: true,
                      resultsSystem: ['N', 'Kg', 'm/s\u00B2'],
                      pageName: 'Peso',
                      params: {
                        Param(name: 'Fuerza (N)'): 0,
                        Param(name: 'Masa (Kg)'): 0,
                        Param(name: 'Gravedad (m/s\u00B2)'): 0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double n = m.values.toList()[1];

                        return t / n;
                      },
                    ),
                  ],
                ],
                'Fricción': [
                  AssetImage('assets/img/formulas/Friccion.PNG'),
                  AssetImage('assets/img/params/Friccion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fricción Estática',
                      params: {
                        Param(name: 'Coeficiente de Fricción Estática'): 1.0,
                        Param(name: 'Normal (N)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double n = m.values.toList()[1];

                        return t / n;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Fricción Cinética',
                      params: {
                        Param(name: 'Coeficiente de Fricción Cinética'): 1.0,
                        Param(name: 'Normal (N)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double n = m.values.toList()[1];

                        return t / n;
                      },
                    ),
                  ],
                ],
                'Fuerza Elástica': [
                  AssetImage('assets/img/formulas/Elastica.PNG'),
                  AssetImage('assets/img/params/Elastica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza Elástica',
                      params: {
                        Param(
                            name: 'Longitud de la Deformación',
                            med: Length()): 1.0,
                        Param(name: 'Constante Elástica'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double n = m.values.toList()[1];

                        return t / n;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
        ],
      ),
    );
  }
}
