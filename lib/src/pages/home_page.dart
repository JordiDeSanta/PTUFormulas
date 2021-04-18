import 'dart:math';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _createMath(),
            _createPhysics(),
            _createQuimics(),
          ],
        ),
      ),
    );
  }

  Widget _createMath() {
    return CourseTileWidget(
      CourseArguments(
        color: Colors.blue[300],
        img: AssetImage('assets/img/matematica.png'),
        route: 'math',
        title: 'Matemática',
        contents: [
          ContentArguments(
            color: Colors.blue[200],
            img: AssetImage('assets/img/numbers.png'),
            route: 'm',
            title: 'Números',
            formulas: FormulaArguments(
              cardColor: Colors.blue[100],
              formulas: {
                'Porcentaje': [
                  AssetImage('assets/img/mathformulas/porcentaje.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Logaritmos': [
                  AssetImage('assets/img/mathformulas/log.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Raices': [
                  AssetImage('assets/img/mathformulas/raices.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.blue[200],
            img: AssetImage('assets/img/algebra.png'),
            route: 'm',
            title: 'Álgebra',
            formulas: FormulaArguments(
              cardColor: Colors.blue[100],
              formulas: {
                'Números': [
                  null,
                  null,
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.blue[200],
            img: AssetImage('assets/img/function.png'),
            route: 'm',
            title: 'Funciones',
            formulas: FormulaArguments(
              cardColor: Colors.blue[100],
              formulas: {
                'Números': [
                  null,
                  null,
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.blue[200],
            img: AssetImage('assets/img/triangle.png'),
            route: 'm',
            title: 'Geometría',
            formulas: FormulaArguments(
              cardColor: Colors.blue[100],
              formulas: {
                'Números': [
                  null,
                  null,
                ],
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPhysics() {
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
            route: 'p',
            title: 'Ondas',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Periódo',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Tiempo Transcurrido': 1.0,
                        'Número de Oscilaciones': 1.0,
                        'Frecuencia': 0.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Tiempo Transcurrido'];
                        double n = m['Número de Oscilaciones'];
                        double f = m['Frecuencia'];
                        if (f != 0.0) {
                          return 1 / f;
                        } else {
                          return t / n;
                        }
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Frecuencia',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Tiempo Transcurrido': 1.0,
                        'Número de Oscilaciones': 1.0,
                        'Periódo': 0.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Tiempo Transcurrido'];
                        double n = m['Número de Oscilaciones'];
                        double p = m['Periódo'];
                        if (p != 0.0) {
                          return 1 / p;
                        } else {
                          return t / n;
                        }
                      },
                    ),
                  ],
                ],
                'Longitud de Onda': [
                  AssetImage('assets/img/formulas/LdeOnda.PNG'),
                  AssetImage('assets/img/params/LdeOnda.PNG'),
                  [
                    FormulaButtonArguments(
                      pageName: 'Longitud de Onda 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud del Tren de Ondas': 1.0,
                        'Número de Oscilaciones': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double l = m['Longitud del Tren de Ondas'];
                        double n = m['Número de Oscilaciones'];
                        return l / n;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Longitud de Onda 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad de Propagación': 1.0,
                        'Periódo': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double v = m['Velocidad de Propagación'];
                        double t = m['Periódo'];
                        return v * t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Longitud de Onda 3',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad de Propagación': 1.0,
                        'Frecuencia': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double v = m['Velocidad de Propagación'];
                        double f = m['Frecuencia'];
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
                      pageName: 'Velocidad de Propagación 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Distancia Recorrida': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double d = m['Distancia Recorrida'];
                        double t = m['Tiempo Transcurrido'];
                        return d / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad de Propagación 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud de Onda': 1.0,
                        'Periódo': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double l = m['Longitud de Onda'];
                        double t = m['Periódo'];
                        return l / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad de Propagación 3',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud de Onda': 1.0,
                        'Frecuencia': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double l = m['Longitud de Onda'];
                        double f = m['Frecuencia'];
                        return l * f;
                      },
                    ),
                  ]
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mru.png'),
            route: 'p',
            title: 'MRU',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Desplazamiento': [
                  AssetImage('assets/img/formulas/Desplazamiento.PNG'),
                  AssetImage('assets/img/params/Desplazamiento.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Desplazamiento',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Posición Final': 1.0,
                        'Posición Inicial': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double xf = m['Posición Final'];
                        double xo = m['Posición Inicial'];
                        return xf - xo;
                      },
                    ),
                  ],
                ],
                'Rapidez': [
                  AssetImage('assets/img/formulas/RapidezMRU.PNG'),
                  AssetImage('assets/img/params/VeldeProp.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Rapidez',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Distancia Recorrida': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double d = m['Distancia Recorrida'];
                        double t = m['Tiempo Transcurrido'];
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
                      pageName: 'Velocidad',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Desplazamiento': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double d = m['Desplazamiento'];
                        double t = m['Tiempo Transcurrido'];
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
                      pageName: 'Posición',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Posición Inicial': 1.0,
                        'Velocidad': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double p = m['Posición Inicial'];
                        double v = m['Velocidad'];
                        double t = m['Tiempo Transcurrido'];
                        return p + (v * t);
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mruvh.png'),
            route: 'p',
            title: 'MRUV',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Aceleración': [
                  AssetImage('assets/img/formulas/AceleracionMRUV.PNG'),
                  AssetImage('assets/img/params/AceleracionMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Aceleración',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Final': 2.0,
                        'Velocidad Inicial': 1.0,
                        'Tiempo Final': 1.0,
                        'Tiempo Inicial': 0.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double vf = m['Velocidad Final'];
                        double to = m['Tiempo Inicial'];
                        double tf = m['Tiempo Final'];

                        if (tf + to <= 0) {
                          return 0.0;
                        } else {
                          return (vf - vo) / (tf - to);
                        }
                      },
                    ),
                  ],
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad según Tiempo',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Aceleración': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double a = m['Aceleración'];
                        double t = m['Tiempo Transcurrido'];

                        return vo + (a * t);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Final',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Aceleración': 1.0,
                        'Desplazamiento': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double a = m['Aceleración'];
                        double d = m['Desplazamiento'];

                        return sqrt((vo * vo) + (2 * a * d));
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRUV.PNG'),
                  AssetImage('assets/img/params/PosicionMRUV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Posición 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Posición Inicial': 1.0,
                        'Velocidad Inicial': 1.0,
                        'Aceleración': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double xo = m['Posición Inicial'];
                        double vo = m['Velocidad Inicial'];
                        double a = m['Aceleración'];
                        double t = m['Tiempo Transcurrido'];

                        return xo + (vo * t) + ((a * t * t) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Posición 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Velocidad Final': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double vf = m['Velocidad Final'];
                        double t = m['Tiempo Transcurrido'];

                        return ((vo + vf) / 2) * t;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mruvv.png'),
            route: 'p',
            title: 'Caída Libre',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUVV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad según Tiempo',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];
                        double t = m['Tiempo Transcurrido'];

                        return vo + (g * t);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Final',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Altura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];
                        double h = m['Altura'];

                        return sqrt((vo * vo) + (2 * g * h));
                      },
                    ),
                  ],
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaMRUVV.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Altura 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Aceleración'];
                        double t = m['Tiempo Transcurrido'];

                        return (vo * t) + ((g * t * t) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Altura 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Velocidad Final': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double vf = m['Velocidad Final'];
                        double t = m['Tiempo Transcurrido'];

                        return ((vo + vf) / 2) * t;
                      },
                    ),
                  ],
                ],
                'Tiempo de Caída': [
                  AssetImage('assets/img/formulas/TiempoMRUVV.PNG'),
                  AssetImage('assets/img/params/TiempoMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Tiempo de Caída',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Tiempo Final': 1.0,
                        'Tiempo Inicial': 0.0,
                        'Gravedad': 9.8,
                      },
                      formula: (Map<String, double> m) {
                        double to = m['Tiempo Inicial'];
                        double tf = m['Tiempo Final'];
                        double g = m['Gravedad'];

                        return (tf - to) / g;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/vert.png'),
            route: 'p',
            title: 'Tiro Vertical',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadUP.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad según Tiempo',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];
                        double t = m['Tiempo Transcurrido'];

                        return vo - (g * t);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Final',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Altura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];
                        double h = m['Altura'];

                        return sqrt((vo * vo) - (2 * g * h));
                      },
                    ),
                  ],
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaUP.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Altura 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Aceleración'];
                        double t = m['Tiempo Transcurrido'];

                        return (vo * t) - ((g * t * t) / 2);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Altura 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Velocidad Final': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double vf = m['Velocidad Final'];
                        double t = m['Tiempo Transcurrido'];

                        return ((vo - vf) / 2) * t;
                      },
                    ),
                  ],
                ],
                'Velocidad Inicial': [
                  AssetImage('assets/img/formulas/Velocidad0UP.PNG'),
                  AssetImage('assets/img/params/Velocidad0UP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad Inicial',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Gravedad': 9.8,
                        'Altura Máxima': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double hm = m['Altura Máxima'];
                        double g = m['Gravedad'];

                        return sqrt(2 * g * hm);
                      },
                    ),
                  ],
                ],
                'Altura Máxima': [
                  AssetImage('assets/img/formulas/AlturaMAX.PNG'),
                  AssetImage('assets/img/params/AlturaMAX.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Altura Máxima',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];

                        return (vo * vo) / (2 * g);
                      },
                    ),
                  ],
                ],
                'Tiempo de Subida': [
                  AssetImage('assets/img/formulas/TiempoUP.PNG'),
                  AssetImage('assets/img/params/TiempoUP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Tiempo de Subida',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Inicial': 1.0,
                        'Gravedad': 9.8,
                      },
                      formula: (Map<String, double> m) {
                        double vo = m['Velocidad Inicial'];
                        double g = m['Gravedad'];

                        return vo / g;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/fuerzas.png'),
            route: 'p',
            title: 'Fuerzas',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Fuerza': [
                  AssetImage('assets/img/formulas/Fuerza.PNG'),
                  AssetImage('assets/img/params/Fuerza.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa': 1.0,
                        'Aceleración': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa'];
                        double a = m['Aceleración'];

                        return ma * a;
                      },
                    ),
                  ],
                ],
                'Peso y Normal': [
                  AssetImage('assets/img/formulas/PesoNormal.PNG'),
                  AssetImage('assets/img/params/PesoNormal.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Peso',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa': 1.0,
                        'Gravedad': 9.8,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa'];
                        double g = m['Gravedad'];

                        return ma * g;
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
                      pageColor: Colors.deepPurple,
                      params: {
                        'Coeficiente de Fricción Estática': 1.0,
                        'Normal': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double cf = m['Coeficiente de Fricción Estática'];
                        double n = m['Normal'];

                        return cf * n;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Fricción Cinética',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Coeficiente de Fricción Cinética': 1.0,
                        'Normal': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double cf = m['Coeficiente de Fricción Cinética'];
                        double n = m['Normal'];

                        return cf * n;
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
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud de la Deformación': 1.0,
                        'Constante Elástica': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double dx = m['Longitud de la Deformación'];
                        double k = m['Constante Elástica'];

                        return (-k) * dx;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/planeta.png'),
            route: 'p',
            title: 'Cosmos',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Gravitación Universal': [
                  AssetImage('assets/img/formulas/Gravitacion.PNG'),
                  AssetImage('assets/img/params/Gravitacion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza de Atracción',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa del primer cuerpo': 1.0,
                        'Masa del segundo cuerpo': 1.0,
                        'Distancia entre sus centros': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double m1 = m['Masa del primer cuerpo'];
                        double m2 = m['Masa del segundo cuerpo'];
                        double r = m['Distancia entre sus centros'];

                        return (6.67 * pow(10, -11)) * ((m1 * m2) / (r * r));
                      },
                    ),
                  ],
                ],
                'Leyes de Kepler': [
                  AssetImage('assets/img/formulas/Kepler.PNG'),
                  AssetImage('assets/img/params/Kepler.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Excentricidad de Órbita',
                      pageColor: Colors.deepPurple,
                      params: {
                        'c': 1.0,
                        'a': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double c = m['c'];
                        double a = m['a'];

                        return c * a;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Constante Orbital',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Periódo': 1.0,
                        'Semieje mayor': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Periódo'];
                        double r = m['Semieje mayor'];

                        return ((pow(t, 2)) / (pow(r, 3)));
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mcu.png'),
            route: 'p',
            title: 'MCU',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT1.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Periódo',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Tiempo Transcurrido': 1.0,
                        'Número de vueltas': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Tiempo Transcurrido'];
                        double n = m['Número de vueltas'];

                        return t / n;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Frecuencia',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Tiempo Transcurrido': 1.0,
                        'Número de vueltas': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Tiempo Transcurrido'];
                        double n = m['Número de vueltas'];

                        return n / t;
                      },
                    ),
                  ],
                ],
                'Velocidad Angular': [
                  AssetImage('assets/img/formulas/VelocidadAMCU.PNG'),
                  AssetImage('assets/img/params/VelocidadAMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad Angular 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Ángulo Recorrido (rad)': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double a = m['Ángulo Recorrido (rad)'];
                        double t = m['Tiempo Transcurrido'];

                        return a / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Angular 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Periódo': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double t = m['Periódo'];

                        return (2 * pi) / t;
                      },
                    ),
                  ],
                ],
                'Velocidad Tangencial': [
                  AssetImage('assets/img/formulas/VelocidadTMCU.PNG'),
                  AssetImage('assets/img/params/VelocidadTMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Velocidad Tangencial 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Angular': 1.0,
                        'Distancia al Eje (o Radio)': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double w = m['Velocidad Angular'];
                        double r = m['Distancia al Eje (o Radio)'];

                        return w * r;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Velocidad Tangencial 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Distancia al Eje (o Radio)': 1.0,
                        'Periódo': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double r = m['Distancia al Eje (o Radio)'];
                        double t = m['Periódo'];

                        return (2 * pi * r) / t;
                      },
                    ),
                  ],
                ],
                'Aceleración Centrípeta': [
                  AssetImage('assets/img/formulas/AceleracionMCU.PNG'),
                  AssetImage('assets/img/params/AceleracionMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Aceleración Centrípeta 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Tangencial': 1.0,
                        'Distancia al Eje (o Radio)': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double v = m['Velocidad Tangencial'];
                        double r = m['Distancia al Eje (o Radio)'];

                        return (v * v) / r;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Aceleración Centrípeta 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Velocidad Angular': 1.0,
                        'Distancia al Eje (o Radio)': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double w = m['Velocidad Angular'];
                        double r = m['Distancia al Eje (o Radio)'];

                        return w * w * r;
                      },
                    ),
                  ],
                ],
                'Fuerza Centrípeta': [
                  AssetImage('assets/img/formulas/FuerzaMCU.PNG'),
                  AssetImage('assets/img/params/FuerzaMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza Centrípeta',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa': 1.0,
                        'Aceleración Centrípeta': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa'];
                        double ac = m['Aceleración Centrípeta'];

                        return ma * ac;
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMCU.PNG'),
                  AssetImage('assets/img/params/PosicionMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Ángulo de Posición',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud del Arco': 1.0,
                        'Distancia al Eje (o Radio)': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double s = m['Longitud del Arco'];
                        double r = m['Distancia al Eje (o Radio)'];

                        return s / r;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/dinrot1.png'),
            route: 'p',
            title: 'Rotacional',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Torque': [
                  AssetImage('assets/img/formulas/Torque.PNG'),
                  AssetImage('assets/img/params/Torque.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Torque',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Fuerza': 1.0,
                        'Longitud perpendicular a la Fuerza': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double f = m['Fuerza'];
                        double l = m['Longitud perpendicular a la Fuerza'];

                        return f * l;
                      },
                    ),
                  ],
                ],
                'Equilibrio Rotacional': [
                  AssetImage('assets/img/formulas/EqRot.PNG'),
                  AssetImage('assets/img/params/EqRot.PNG'),
                  <FormulaButtonArguments>[],
                ],
                'Momento Angular': [
                  AssetImage('assets/img/formulas/MomentoAngular.PNG'),
                  AssetImage('assets/img/params/MomentoAngular.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Momento Angular',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Momento de Inercia': 1.0,
                        'Velocidad Angular': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double i = m['Momento de Inercia'];
                        double w = m['Velocidad Angular'];

                        return i * w;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/presion.png'),
            route: 'p',
            title: 'Presión',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Presión': [
                  AssetImage('assets/img/formulas/Presion.PNG'),
                  AssetImage('assets/img/params/Presion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Presión',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Fuerza Aplicada': 1.0,
                        'Área': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double f = m['Fuerza Aplicada'];
                        double a = m['Área'];

                        return f / a;
                      },
                    ),
                  ],
                ],
                'Presión Hidrostática': [
                  AssetImage('assets/img/formulas/Hidrostatica.PNG'),
                  AssetImage('assets/img/params/Hidrostatica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Presión Hidrostática',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Densidad': 1.0,
                        'Gravedad': 1.0,
                        'Altura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double d = m['Densidad'];
                        double g = m['Gravedad'];
                        double h = m['Altura'];

                        return d * g * h;
                      },
                    ),
                  ],
                ],
                'Presión Absoluta': [
                  AssetImage('assets/img/formulas/PresionAbs.PNG'),
                  AssetImage('assets/img/params/PresionAbs.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Presión Absoluta',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Presión Hidrostática': 1.0,
                        'Presión Atmosférica': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double h = m['Presión Hidrostática'];
                        double a = m['Presión Atmosférica'];

                        return h + a;
                      },
                    ),
                  ],
                ],
                'Pascal': [
                  AssetImage('assets/img/formulas/Pascal.PNG'),
                  AssetImage('assets/img/params/Pascal.PNG'),
                  <FormulaButtonArguments>[],
                ],
                'Arquímedes': [
                  AssetImage('assets/img/formulas/Arquimedes.PNG'),
                  AssetImage('assets/img/params/Arquimedes.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza de Flotación',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Densidad': 1.0,
                        'Volumen': 1.0,
                        'Altura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double d = m['Densidad'];
                        double v = m['Volumen'];
                        double h = m['Altura'];

                        return d * v * h;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/dinrot.png'),
            route: 'p',
            title: 'Energías',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Energía Cinética': [
                  AssetImage('assets/img/formulas/Cinetica.PNG'),
                  AssetImage('assets/img/params/cinetica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Energía Cinética',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa': 1.0,
                        'Velocidad': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa'];
                        double v = m['Velocidad'];

                        return (ma * v * v) / 2;
                      },
                    ),
                  ],
                ],
                'Energía Potencial': [
                  AssetImage('assets/img/formulas/Potencial.PNG'),
                  AssetImage('assets/img/params/Potencial.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Energía Gravitatoria',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa': 1.0,
                        'Gravedad': 1.0,
                        'Altura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa'];
                        double g = m['Gravedad'];
                        double h = m['Altura'];

                        return ma * g * h;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Energía Elástica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Constante Elástica': 1.0,
                        'Longitud de la Deformación': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double k = m['Constante Elástica'];
                        double dx = m['Longitud de la Deformación'];

                        return (k * dx * dx) / 2;
                      },
                    ),
                  ],
                ],
                'Energía Mecánica': [
                  AssetImage('assets/img/formulas/Mecanica.PNG'),
                  AssetImage('assets/img/params/Mecanica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Energía Mecánica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Energía Cinética': 1.0,
                        'Energía Potencial': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ec = m['Energía Cinética'];
                        double ep = m['Energía Potencial'];

                        return ec + ep;
                      },
                    ),
                  ],
                ],
                'Conservación de Energía': [
                  AssetImage('assets/img/formulas/ConservacionEnergia.PNG'),
                  AssetImage('assets/img/params/ConservacionEnergia.PNG'),
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/trabajo.png'),
            route: 'p',
            title: 'Trabajo',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Fuerza Disipativa': [
                  AssetImage('assets/img/formulas/Disipativa.PNG'),
                  AssetImage('assets/img/params/Disipativa.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Energía Mecánica Inicial',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Energía Mecánica Inicial': 1.0,
                        'Trabajo de la Fuerza': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double em = m['Energía Mecánica Inicial'];
                        double wf = m['Trabajo de la Fuerza'];

                        return em + wf.abs();
                      },
                    ),
                  ],
                ],
                'Trabajo y Potencia': [
                  AssetImage('assets/img/formulas/TyP.PNG'),
                  AssetImage('assets/img/params/TyP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Trabajo 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Fuerza': 1.0,
                        'Distancia': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double f = m['Fuerza'];
                        double d = m['Distancia'];

                        return f * d;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Trabajo 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Energía Cinética Final': 1.0,
                        'Energía Cinética Inicial': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ecf = m['Energía Cinética Final'];
                        double eco = m['Energía Cinética Inicial'];

                        return ecf - eco;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Potencia 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Trabajo': 1.0,
                        'Tiempo': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double w = m['Trabajo'];
                        double t = m['Tiempo'];

                        return w / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Potencia 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Fuerza': 1.0,
                        'Velocidad': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double f = m['Fuerza'];
                        double v = m['Velocidad'];

                        return f * v;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/termo.png'),
            route: 'p',
            title: 'Termodinámica',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Cantidad de Calor': [
                  AssetImage('assets/img/formulas/CantidadCalor.PNG'),
                  AssetImage('assets/img/params/CantidadCalor.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Calor Requerido 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa del Cuerpo': 1.0,
                        'Calor Especifico del Material': 1.0,
                        'Cambio en la Temperatura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa del Cuerpo'];
                        double c = m['Calor Especifico del Material'];
                        double dt = m['Cambio en la Temperatura'];

                        return ma * c * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Calor Requerido 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Masa del Cuerpo': 1.0,
                        'Calor Latente': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double ma = m['Masa del Cuerpo'];
                        double l = m['Calor Latente'];

                        return l * ma;
                      },
                    ),
                  ],
                ],
                'Capacidad Térmica': [
                  AssetImage('assets/img/formulas/CapacidadTermica.PNG'),
                  AssetImage('assets/img/params/CapacidadTermica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Capacidad Térmica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Cambio en el Calor': 1.0,
                        'Cambio en la Temperatura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double dq = m['Cambio en el Calor'];
                        double dt = m['Cambio en la Temperatura'];

                        return dq / dt;
                      },
                    ),
                  ],
                ],
                'Calor Específico': [
                  AssetImage('assets/img/formulas/CalorEspecifico.PNG'),
                  AssetImage('assets/img/params/CalorEspecifico.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Calor Específico',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Capacidad Térmica': 1.0,
                        'Masa': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double c = m['Capacidad Térmica'];
                        double ma = m['Masa'];

                        return c / ma;
                      },
                    ),
                  ],
                ],
                'Dilatación Térmica': [
                  AssetImage('assets/img/formulas/Dilatacion.PNG'),
                  AssetImage('assets/img/params/Dilatacion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Cambio Lineal',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Longitud Inicial': 1.0,
                        'Coeficiente de Dilatación Lineal': 1.0,
                        'Cambio en la Temperatura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double lo = m['Longitud Inicial'];
                        double a = m['Coeficiente de Dilatación Lineal'];
                        double dt = m['Cambio en la Temperatura'];

                        return lo * a * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Cambio Superficial',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Área Inicial': 1.0,
                        'Coeficiente de Dilatación Superficial': 1.0,
                        'Cambio en la Temperatura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double lo = m['Longitud Inicial'];
                        double b = m['Coeficiente de Dilatación Superficial'];
                        double dt = m['Cambio en la Temperatura'];

                        return lo * b * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Cambio Volumétrico',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Volumen Inicial': 1.0,
                        'Coeficiente de Dilatación Volumétrica': 1.0,
                        'Cambio en la Temperatura': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double lo = m['Longitud Inicial'];
                        double g = m['Coeficiente de Dilatación Volumétrica'];
                        double dt = m['Cambio en la Temperatura'];

                        return lo * g * dt;
                      },
                    ),
                  ],
                ],
                'Equilibrio Térmico': [
                  AssetImage('assets/img/formulas/EqTer.PNG'),
                  AssetImage('assets/img/params/EqTer.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Calor Cedido',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Calor Absorbido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double qa = m['Calor Absorbido'];

                        return -qa;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Calor Absorbido',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Calor Cedido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double qc = m['Calor Cedido'];

                        return -qc;
                      },
                    ),
                  ],
                ],
                'Calor Latente': [
                  AssetImage('assets/img/formulas/Latente.PNG'),
                  AssetImage('assets/img/params/Latente.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Calor Latente',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Calor': 1.0,
                        'Masa': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double q = m['Calor'];
                        double ma = m['Masa'];

                        return q / ma;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/electric.png'),
            route: 'p',
            title: 'Electricidad y Magnetismo',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Ley de Coulomb': [
                  AssetImage('assets/img/formulas/Coulomb.PNG'),
                  AssetImage('assets/img/params/Coulomb.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza Eléctrica 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Primera Carga': 1.0,
                        'Segunda Carga': 1.0,
                        'Distancia entre Cargas': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double q1 = m['Primera Carga'];
                        double q2 = m['Segunda Carga'];
                        double r = m['Distancia entre Cargas'];

                        return (9 * pow(10, 9)) * ((q1 * q2).abs() / (r * r));
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Fuerza Eléctrica 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Campo Eléctrico': 1.0,
                        'Carga': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double e = m['Campo Eléctrico'];
                        double q = m['Carga'];

                        return e * q;
                      },
                    ),
                  ],
                ],
                'Campo Eléctrico': [
                  AssetImage('assets/img/formulas/CampoElectrico.PNG'),
                  AssetImage('assets/img/params/CampoElectrico.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Campo Eléctrico 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Fuerza Eléctrica': 1.0,
                        'Carga': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double f = m['Fuerza Eléctrica'];
                        double q = m['Carga'];

                        return f / q;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Campo Eléctrico 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Carga': 1.0,
                        'Distancia hacia el punto': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double q = m['Carga'];
                        double r = m['Distancia entre Cargas'];

                        return ((9 * pow(10, 9) * q) / (r * r));
                      },
                    ),
                  ],
                ],
                'Ley de Ohm': [
                  AssetImage('assets/img/formulas/Ohm.PNG'),
                  AssetImage('assets/img/params/Ohm.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Intensidad Eléctrica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Carga': 1.0,
                        'Tiempo Transcurrido': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double q = m['Carga'];
                        double t = m['Tiempo Transcurrido'];

                        return q / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Voltaje 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Intensidad Eléctrica': 1.0,
                        'Resistencia': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double i = m['Intensidad Eléctrica'];
                        double r = m['Resistencia'];

                        return i * r;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Voltaje 2',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Carga': 1.0,
                        'Distancia hacia el punto': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double q = m['Carga'];
                        double r = m['Distancia hacia el punto'];

                        return ((9 * pow(10, 9)) * (q / r));
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Resistencia',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Resistividad del Material': 1.0,
                        'Longitud del Cable': 1.0,
                        'Area (círculo) del (cilíndro) Cable': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double r = m['Resistividad del Material'];
                        double l = m['Longitud del Cable'];
                        double a = m['Area (círculo) del (cilíndro) Cable'];

                        return (r * l) / a;
                      },
                    ),
                  ],
                ],
                'Circuitos en Serie': [
                  AssetImage('assets/img/formulas/EnSerie.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Potencia Eléctrica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Voltaje Total': 1.0,
                        'Intensidad Eléctrica': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double vt = m['Voltaje Total'];
                        double i = m['Intensidad Eléctrica'];

                        return vt * i;
                      },
                    ),
                  ],
                ],
                'Circuitos en Paralelo': [
                  AssetImage('assets/img/formulas/EnParalelo.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Resistencia Total 1',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Sumatoria de las Resistencias': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double er = m['Sumatoria de las Resistencias'];

                        return 1 / er;
                      },
                    ),
                  ],
                  FormulaButtonArguments(
                    pageName: 'Resistencia Total 2',
                    pageColor: Colors.deepPurple,
                    params: {
                      'Resistencia 1': 1.0,
                      'Resistencia 2': 1.0,
                    },
                    formula: (Map<String, double> m) {
                      double r1 = m['Resistencia 1'];
                      double r2 = m['Resistencia 2'];

                      return (r1 + r2) / (r1 * r2);
                    },
                  ),
                  FormulaButtonArguments(
                    pageName: 'Potencia Eléctrica',
                    pageColor: Colors.deepPurple,
                    params: {
                      'Voltaje': 1.0,
                      'Intensidad Eléctrica Total': 1.0,
                    },
                    formula: (Map<String, double> m) {
                      double v = m['Voltaje'];
                      double it = m['Intensidad Eléctrica Total'];

                      return v * it;
                    },
                  ),
                ],
                'Ley de Watt': [
                  AssetImage('assets/img/formulas/Watt.PNG'),
                  AssetImage('assets/img/params/Watt.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Potencia Eléctrica',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Voltaje': 1.0,
                        'Intensidad Eléctrica': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double v = m['Voltaje'];
                        double i = m['Intensidad Eléctrica'];

                        return v * i;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Energía Consumida (kWh)',
                      pageColor: Colors.deepPurple,
                      params: {
                        'Potencia Eléctrica (W)': 1.0,
                        'Tiempo Activo (h)': 1.0,
                      },
                      formula: (Map<String, double> m) {
                        double p = m['Potencia Eléctrica (W)'];
                        double t = m['Tiempo Activo (h)'];

                        return (p * t) / 1000;
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

  Widget _createQuimics() {
    return CourseTileWidget(
      CourseArguments(
          color: Colors.green[300],
          img: AssetImage('assets/img/quimica.png'),
          route: 'quimics',
          title: 'Química',
          contents: [
            ContentArguments(
              color: Colors.green[200],
              img: AssetImage('assets/img/quimica.png'),
              route: 'q',
              title: 'A CTM',
              formulas: FormulaArguments(
                cardColor: Colors.green[100],
                formulas: {
                  'Periódo y Frecuencia': [
                    AssetImage('assets/img/formulas/PyT.PNG'),
                    AssetImage('assets/img/params/PyT.PNG'),
                  ],
                },
              ),
            ),
          ]),
    );
  }
}
