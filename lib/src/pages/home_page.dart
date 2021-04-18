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
                'Números': [
                  null,
                  null,
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
                ],
                'Equilibrio Rotacional': [
                  AssetImage('assets/img/formulas/EqRot.PNG'),
                  AssetImage('assets/img/params/EqRot.PNG'),
                ],
                'Momento Angular': [
                  AssetImage('assets/img/formulas/MomentoAngular.PNG'),
                  AssetImage('assets/img/params/MomentoAngular.PNG'),
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
                ],
                'Presión Hidrostática': [
                  AssetImage('assets/img/formulas/Hidrostatica.PNG'),
                  AssetImage('assets/img/params/Hidrostatica.PNG'),
                ],
                'Presión Absoluta': [
                  AssetImage('assets/img/formulas/PresionAbs.PNG'),
                  AssetImage('assets/img/params/PresionAbs.PNG'),
                ],
                'Pascal': [
                  AssetImage('assets/img/formulas/Pascal.PNG'),
                  AssetImage('assets/img/params/Pascal.PNG'),
                ],
                'Arquímedes': [
                  AssetImage('assets/img/formulas/Arquimedes.PNG'),
                  AssetImage('assets/img/params/Arquimedes.PNG'),
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
                ],
                'Energía Potencial': [
                  AssetImage('assets/img/formulas/Potencial.PNG'),
                  AssetImage('assets/img/params/Potencial.PNG'),
                ],
                'Energía Mecánica': [
                  AssetImage('assets/img/formulas/Mecanica.PNG'),
                  AssetImage('assets/img/params/Mecanica.PNG'),
                ],
                'Conservación de Energía': [
                  AssetImage('assets/img/formulas/ConservacionEnergia.PNG'),
                  AssetImage('assets/img/params/ConservacionEnergia.PNG'),
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
                ],
                'Trabajo y Potencia': [
                  AssetImage('assets/img/formulas/TyP.PNG'),
                  AssetImage('assets/img/params/TyP.PNG'),
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
                ],
                'Capacidad Térmica': [
                  AssetImage('assets/img/formulas/CapacidadTermica.PNG'),
                  AssetImage('assets/img/params/CapacidadTermica.PNG'),
                ],
                'Calor Específico': [
                  AssetImage('assets/img/formulas/CalorEspecifico.PNG'),
                  AssetImage('assets/img/params/CalorEspecifico.PNG'),
                ],
                'Dilatación Térmica': [
                  AssetImage('assets/img/formulas/Dilatacion.PNG'),
                  AssetImage('assets/img/params/Dilatacion.PNG'),
                ],
                'Equilibrio Térmico': [
                  AssetImage('assets/img/formulas/EqTer.PNG'),
                  AssetImage('assets/img/params/EqTer.PNG'),
                ],
                'Calor Latente': [
                  AssetImage('assets/img/formulas/Latente.PNG'),
                  AssetImage('assets/img/params/Latente.PNG'),
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
                ],
                'Campo Eléctrico': [
                  AssetImage('assets/img/formulas/CampoElectrico.PNG'),
                  AssetImage('assets/img/params/CampoElectrico.PNG'),
                ],
                'Ley de Ohm': [
                  AssetImage('assets/img/formulas/Ohm.PNG'),
                  AssetImage('assets/img/params/Ohm.PNG'),
                ],
                'Circuitos en Serie': [
                  AssetImage('assets/img/formulas/EnSerie.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                ],
                'Circuitos en Paralelo': [
                  AssetImage('assets/img/formulas/EnParalelo.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                ],
                'Ley de Watt': [
                  AssetImage('assets/img/formulas/Watt.PNG'),
                  AssetImage('assets/img/params/Watt.PNG'),
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
