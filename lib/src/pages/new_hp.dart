import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/themes/colors_theme.dart';
import 'package:ptuformulas/src/widgets/course_tile_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:ptuformulas/src/providers/ad_state.dart';

class NewHomePage extends StatefulWidget {
  NewHomePage({Key key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final styles = TextStyles();
  final colors = ColorsTheme();

  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.largeBanner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('PTU Fórmulas', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black26,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10.0),
            _createPhysics(),
            if (banner == null)
              SizedBox(height: 80.0)
            else
              Container(
                height: 80,
                child: AdWidget(
                  ad: banner,
                ),
              )
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
                      pageName: 'Fma',
                      params: {
                        Param(name: 'Fuerza', med: Force()): 0,
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
                      pageName: 'Pmg',
                      params: {
                        Param(name: 'Fuerza', med: Force()): 0,
                        Param(name: 'Masa', med: Mass()): 0,
                        Param(name: 'Gravedad', med: Aceleration()): 0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputM = m.values.toList()[1];
                        double inputG = m.values.toList()[2];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double ma = m.keys.toList()[1].getValue(inputM);
                        double g = m.keys.toList()[2].getValue(inputG);

                        if (f == 0) return ma * g;
                        if (ma == 0) return f / g;
                        if (g == 0) return f / ma;
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Fricción': [
                  AssetImage('assets/img/formulas/Friccion.PNG'),
                  AssetImage('assets/img/params/Friccion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Force(),
                      pageName: 'Fricción Estática',
                      params: {
                        Param(name: 'Coeficiente de Fricción Estática'): 1.0,
                        Param(name: 'Normal', med: Force()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double c = m.values.toList()[0];
                        double n = m.values.toList()[1];

                        return c * n;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Force(),
                      pageName: 'Fricción Cinética',
                      params: {
                        Param(name: 'Coeficiente de Fricción Cinética'): 1.0,
                        Param(name: 'Normal', med: Force()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double c = m.values.toList()[0];
                        double n = m.values.toList()[1];

                        return c * n;
                      },
                    ),
                  ],
                ],
                'Fuerza Elástica': [
                  AssetImage('assets/img/formulas/Elastica.PNG'),
                  AssetImage('assets/img/params/Elastica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Force(),
                      pageName: 'Fuerza Elástica',
                      params: {
                        Param(
                            name: 'Longitud de la Deformación',
                            med: Length()): 1.0,
                        Param(name: 'Constante Elástica'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL = m.values.toList()[0];

                        double l = m.keys.toList()[0].getValue(inputL);
                        double k = m.values.toList()[1];

                        return -k * l;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/planeta.png'),
            route: 'p',
            title: 'Cosmos',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Gravitación Universal': [
                  AssetImage('assets/img/formulas/Gravitacion.PNG'),
                  AssetImage('assets/img/params/Gravitacion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Force(),
                      pageName: 'Fuerza de Atracción',
                      params: {
                        Param(name: 'Masa del cuerpo 1 (Kg)', med: Mass()): 1.0,
                        Param(name: 'Masa del cuerpo 2 (Kg)', med: Mass()): 1.0,
                        Param(
                          name: 'Distancia entre sus centros (km)',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM1 = m.values.toList()[0];
                        double inputM2 = m.values.toList()[1];
                        double inputR = m.values.toList()[2];

                        double m1 = m.keys.toList()[0].getValue(inputM1);
                        double m2 = m.keys.toList()[1].getValue(inputM2);
                        double r = m.keys.toList()[2].getValue(inputR);

                        double g = 6.67e-11;

                        return (g) * ((m1 * m2) / pow(r, 2));
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
                      params: {
                        Param(name: 'c'): 1.0,
                        Param(name: 'a'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double c = m.values.toList()[0];
                        double a = m.values.toList()[1];

                        return c / a;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Constante Orbital',
                      params: {
                        Param(name: 'Periódo', med: Time()): 1.0,
                        Param(name: 'Semieje mayor', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double t = m.keys.toList()[0].getValue(inputT);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return pow(t, 2) / pow(r, 3);
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/mcu.png'),
            route: 'p',
            title: 'MCU',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT1.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Time(),
                      pageName: 'Periódo',
                      params: {
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                        Param(name: 'Número de vueltas'): 1.0,
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
                        Param(name: 'Número de vueltas'): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[1];

                        double n = m.values.toList()[0];
                        double t = m.keys.toList()[1].getValue(inputT);

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
                      resultUnit: AngleVelocity(),
                      pageName: 'Velocidad Angular 1',
                      params: {
                        Param(name: 'Ángulo Recorrido', med: Angle()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputAR = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double a = m.keys.toList()[0].getValue(inputAR);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return a / t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: AngleVelocity(),
                      pageName: 'Velocidad Angular 2',
                      params: {
                        Param(name: 'Periódo', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputT = m.values.toList()[0];

                        double t = m.keys.toList()[0].getValue(inputT);

                        return 2 * pi / t;
                      },
                    ),
                  ],
                ],
                'Velocidad Tangencial': [
                  AssetImage('assets/img/formulas/VelocidadTMCU.PNG'),
                  AssetImage('assets/img/params/VelocidadTMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad Tangencial 1',
                      params: {
                        Param(
                          name: 'Velocidad Angular',
                          med: AngleVelocity(),
                        ): 1.0,
                        Param(
                          name: 'Distancia al Eje (o Radio)',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputW = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double w = m.keys.toList()[0].getValue(inputW);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return w * r;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: VelocityU(),
                      pageName: 'Velocidad Tangencial 2',
                      params: {
                        Param(
                          name: 'Distancia al Eje (o Radio)',
                          med: Length(),
                        ): 1.0,
                        Param(name: 'Periódo', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputR = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double r = m.keys.toList()[0].getValue(inputR);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return 2 * pi * r / t;
                      },
                    ),
                  ],
                ],
                'Aceleración Centrípeta': [
                  AssetImage('assets/img/formulas/AceleracionMCU.PNG'),
                  AssetImage('assets/img/params/AceleracionMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Aceleration(),
                      pageName: 'Aceleración Centrípeta 1',
                      params: {
                        Param(
                          name: 'Velocidad Tangencial',
                          med: VelocityU(),
                        ): 1.0,
                        Param(
                          name: 'Distancia al Eje (o Radio)',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double v = m.keys.toList()[0].getValue(inputV);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return pow(v, 2) / r;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Aceleration(),
                      pageName: 'Aceleración Centrípeta 2',
                      params: {
                        Param(
                          name: 'Velocidad Angular',
                          med: AngleVelocity(),
                        ): 1.0,
                        Param(
                          name: 'Distancia al Eje (o Radio)',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputW = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double w = m.keys.toList()[0].getValue(inputW);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return pow(w, 2) * r;
                      },
                    ),
                  ],
                ],
                'Fuerza Centrípeta': [
                  AssetImage('assets/img/formulas/FuerzaMCU.PNG'),
                  AssetImage('assets/img/params/FuerzaMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Force(),
                      pageName: 'Fuerza Centrípeta',
                      params: {
                        Param(name: 'Masa', med: Mass()): 1.0,
                        Param(
                            name: 'Aceleración Centrípeta',
                            med: Aceleration()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputA = m.values.toList()[1];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double a = m.keys.toList()[1].getValue(inputA);

                        return ma * a;
                      },
                    ),
                  ],
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMCU.PNG'),
                  AssetImage('assets/img/params/PosicionMCU.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Angle(),
                      pageName: 'Ángulo de Posición',
                      params: {
                        Param(name: 'Longitud del Arco', med: Length()): 1.0,
                        Param(
                          name: 'Distancia al Eje (o Radio)',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputS = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double s = m.keys.toList()[0].getValue(inputS);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return s / r;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/dinrot1.png'),
            route: 'p',
            title: 'Rotacional',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Torque': [
                  AssetImage('assets/img/formulas/Torque.PNG'),
                  AssetImage('assets/img/params/Torque.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Torque',
                      params: {
                        Param(name: 'Fuerza', med: Force()): 1.0,
                        Param(
                            name: 'Longitud perpendicular a la Fuerza',
                            med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputL = m.values.toList()[1];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double l = m.keys.toList()[1].getValue(inputL);

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
                      params: {
                        Param(name: 'Momento de Inercia'): 1.0,
                        Param(name: 'Velocidad Angular', med: AngleVelocity()):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputW = m.values.toList()[1];
                        double w = m.keys.toList()[1].getValue(inputW);

                        double i = m.values.toList()[0];

                        return i * w;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/presion.png'),
            route: 'p',
            title: 'Presión',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Presión': [
                  AssetImage('assets/img/formulas/Presion.PNG'),
                  AssetImage('assets/img/params/Presion.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Pressure(),
                      pageName: 'Presión',
                      params: {
                        Param(name: 'Fuerza Aplicada', med: Force()): 1.0,
                        Param(name: 'Área', med: Area()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputA = m.values.toList()[1];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double a = m.keys.toList()[1].getValue(inputA);

                        return f / a;
                      },
                    ),
                  ],
                ],
                'Densidad': [
                  AssetImage('assets/img/formulas/dens.PNG'),
                  AssetImage('assets/img/params/pdens.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Density(),
                      pageName: 'Densidad',
                      params: {
                        Param(name: 'Masa', med: Mass()): 1.0,
                        Param(name: 'Volumen', med: Volumen()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputV = m.values.toList()[1];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double v = m.keys.toList()[1].getValue(inputV);

                        return ma / v;
                      },
                    ),
                  ],
                ],
                'Presión Hidrostática': [
                  AssetImage('assets/img/formulas/Hidrostatica.PNG'),
                  AssetImage('assets/img/params/Hidrostatica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Pressure(),
                      pageName: 'Presión Hidrostática',
                      params: {
                        Param(name: 'Densidad', med: Density()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 1.0,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputD = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputH = m.values.toList()[2];

                        double d = m.keys.toList()[0].getValue(inputD);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double h = m.keys.toList()[2].getValue(inputH);

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
                      resultUnit: Pressure(),
                      pageName: 'Presión Absoluta',
                      params: {
                        Param(name: 'Presión Hidrostática', med: Pressure()):
                            1.0,
                        Param(name: 'Presión Atmosférica', med: Pressure()):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputph = m.values.toList()[0];
                        double inputpa = m.values.toList()[1];

                        double ph = m.keys.toList()[0].getValue(inputph);
                        double pa = m.keys.toList()[1].getValue(inputpa);

                        return ph + pa;
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
                      params: {
                        Param(name: 'Densidad', med: Density()): 1.0,
                        Param(name: 'Volumen', med: Volumen()): 1.0,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputD = m.values.toList()[0];
                        double inputV = m.values.toList()[1];
                        double inputH = m.values.toList()[2];

                        double d = m.keys.toList()[0].getValue(inputD);
                        double v = m.keys.toList()[1].getValue(inputV);
                        double h = m.keys.toList()[2].getValue(inputH);

                        return d * v * h;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/dinrot.png'),
            route: 'p',
            title: 'Energías',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Energía Cinética': [
                  AssetImage('assets/img/formulas/Cinetica.PNG'),
                  AssetImage('assets/img/params/cinetica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Cinética',
                      params: {
                        Param(name: 'Masa', med: Mass()): 1.0,
                        Param(name: 'Velocidad', med: VelocityU()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputV = m.values.toList()[1];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double v = m.keys.toList()[1].getValue(inputV);

                        return (ma * pow(v, 2)) / 2;
                      },
                    ),
                  ],
                ],
                'Energía Potencial': [
                  AssetImage('assets/img/formulas/Potencial.PNG'),
                  AssetImage('assets/img/params/Potencial.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Gravitatoria',
                      params: {
                        Param(name: 'Masa', med: Mass()): 1.0,
                        Param(name: 'Gravedad', med: Aceleration()): 1.0,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputG = m.values.toList()[1];
                        double inputH = m.values.toList()[2];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double g = m.keys.toList()[1].getValue(inputG);
                        double h = m.keys.toList()[2].getValue(inputH);

                        return ma * g * h;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Elástica',
                      params: {
                        Param(name: 'Constante Elástica'): 1.0,
                        Param(
                          name: 'Longitud de la Deformación',
                          med: Length(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputK = m.values.toList()[0];
                        double inputX = m.values.toList()[1];

                        double k = m.keys.toList()[0].getValue(inputK);
                        double dx = m.keys.toList()[1].getValue(inputX);

                        return (k * pow(dx, 2)) / 2;
                      },
                    ),
                  ],
                ],
                'Energía Mecánica': [
                  AssetImage('assets/img/formulas/Mecanica.PNG'),
                  AssetImage('assets/img/params/Mecanica.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Mecánica',
                      params: {
                        Param(name: 'Energía Cinética', med: Energy()): 1.0,
                        Param(name: 'Energía Potencial', med: Energy()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputC = m.values.toList()[0];
                        double inputP = m.values.toList()[1];

                        double ec = m.keys.toList()[0].getValue(inputC);
                        double ep = m.keys.toList()[1].getValue(inputP);

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
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/trabajo.png'),
            route: 'p',
            title: 'Trabajo',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Fuerza Disipativa': [
                  AssetImage('assets/img/formulas/Disipativa.PNG'),
                  AssetImage('assets/img/params/Disipativa.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Mecánica Inicial',
                      params: {
                        Param(
                          name: 'Energía Mecánica Final',
                          med: Energy(),
                        ): 1.0,
                        Param(name: 'Trabajo de la Fuerza', med: Energy()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputE = m.values.toList()[0];
                        double inputW = m.values.toList()[1];

                        double em = m.keys.toList()[0].getValue(inputE);
                        double w = m.keys.toList()[1].getValue(inputW);

                        return em + w.abs();
                      },
                    ),
                  ],
                ],
                'Trabajo y Potencia': [
                  AssetImage('assets/img/formulas/TyP.PNG'),
                  AssetImage('assets/img/params/TyP.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Trabajo 1',
                      params: {
                        Param(name: 'Fuerza', med: Force()): 1.0,
                        Param(name: 'Distancia', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputD = m.values.toList()[1];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double d = m.keys.toList()[1].getValue(inputD);

                        return f * d;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Trabajo 2',
                      params: {
                        Param(
                          name: 'Energía Cinética Final',
                          med: Energy(),
                        ): 1.0,
                        Param(
                          name: 'Energía Cinética Inicial',
                          med: Energy(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputCF = m.values.toList()[0];
                        double inputC0 = m.values.toList()[1];

                        double cf = m.keys.toList()[0].getValue(inputCF);
                        double c0 = m.keys.toList()[1].getValue(inputC0);

                        return cf - c0;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Potencia 1',
                      params: {
                        Param(name: 'Trabajo', med: Energy()): 1.0,
                        Param(name: 'Tiempo', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputW = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double w = m.keys.toList()[0].getValue(inputW);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return w / t;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Potencia 2',
                      params: {
                        Param(name: 'Fuerza', med: Force()): 1.0,
                        Param(name: 'Velocidad', med: VelocityU()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputV = m.values.toList()[1];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double v = m.keys.toList()[1].getValue(inputV);

                        return f * v;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/termo.png'),
            route: 'p',
            title: 'Termodinámica',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Cantidad de Calor': [
                  AssetImage('assets/img/formulas/CantidadCalor.PNG'),
                  AssetImage('assets/img/params/CantidadCalor.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Calor Requerido 1',
                      params: {
                        Param(name: 'Masa del Cuerpo', med: Mass()): 1.0,
                        Param(name: 'Calor Especifico del Material'): 1.0,
                        Param(
                          name: 'Cambio en la Temperatura',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputDT = m.values.toList()[2];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double c = m.values.toList()[1];
                        double dt = m.keys.toList()[2].temp(inputDT);

                        return ma * c * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Calor Requerido 2',
                      params: {
                        Param(name: 'Masa del Cuerpo', med: Mass()): 1.0,
                        Param(name: 'Calor Latente'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double l = m.values.toList()[1];

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
                      params: {
                        Param(name: 'Cambio en el Calor', med: Energy()): 1.0,
                        Param(
                          name: 'Cambio en la Temperatura',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputDQ = m.values.toList()[0];
                        double inputDT = m.values.toList()[1];

                        double dq = m.keys.toList()[0].getValue(inputDQ);
                        double dt = m.keys.toList()[1].temp(inputDT);

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
                      params: {
                        Param(name: 'Capacidad Térmica'): 1.0,
                        Param(name: 'Masa', med: Mass()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputC = m.values.toList()[0];
                        double inputM = m.values.toList()[1];

                        double c = m.keys.toList()[0].getValue(inputC);
                        double ma = m.keys.toList()[1].temp(inputM);

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
                      resultUnit: Length(),
                      pageName: 'Cambio Lineal',
                      params: {
                        Param(name: 'Longitud Inicial', med: Length()): 1.0,
                        Param(name: 'Coeficiente de Dilatación Lineal'): 1.0,
                        Param(
                          name: 'Cambio en la Temperatura',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL0 = m.values.toList()[0];
                        double inputDT = m.values.toList()[2];

                        double lo = m.keys.toList()[0].getValue(inputL0);
                        double a = m.values.toList()[1];
                        double dt = m.keys.toList()[2].temp(inputDT);

                        return lo * a * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Area(),
                      pageName: 'Cambio Superficial',
                      params: {
                        Param(name: 'Área Inicial', med: Area()): 1.0,
                        Param(name: 'Coeficiente de Dilatación Superficial'):
                            1.0,
                        Param(
                          name: 'Cambio en la Temperatura',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputS0 = m.values.toList()[0];
                        double inputDT = m.values.toList()[2];

                        double so = m.keys.toList()[0].getValue(inputS0);
                        double b = m.values.toList()[1];
                        double dt = m.keys.toList()[2].temp(inputDT);

                        return so * b * dt;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Volumen(),
                      pageName: 'Cambio Volumétrico',
                      params: {
                        Param(name: 'Volumen Inicial', med: Volumen()): 1.0,
                        Param(name: 'Coeficiente de Dilatación Volumétrica'):
                            1.0,
                        Param(
                          name: 'Cambio en la Temperatura',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputDT = m.values.toList()[2];

                        double vo = m.keys.toList()[0].getValue(inputV0);
                        double g = m.values.toList()[1];
                        double dt = m.keys.toList()[2].temp(inputDT);

                        return vo * g * dt;
                      },
                    ),
                  ],
                ],
                'Equilibrio Térmico': [
                  AssetImage('assets/img/formulas/EqTer.PNG'),
                  AssetImage('assets/img/params/EqTer.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Calor Cedido',
                      params: {
                        Param(name: 'Calor Absorbido', med: Energy()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQa = m.values.toList()[0];

                        double qabs = m.keys.toList()[0].getValue(inputQa);

                        return -qabs;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Calor Absorbido',
                      params: {
                        Param(name: 'Calor Cedido', med: Energy()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQc = m.values.toList()[0];

                        double qced = m.keys.toList()[0].getValue(inputQc);

                        return -qced;
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
                      params: {
                        Param(name: 'Calor', med: Energy()): 1.0,
                        Param(name: 'Masa', med: Mass()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQ = m.values.toList()[0];
                        double inputM = m.values.toList()[1];

                        double q = m.keys.toList()[0].getValue(inputQ);
                        double ma = m.keys.toList()[1].getValue(inputM);

                        return q / ma;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.physics[2],
            img: AssetImage('assets/img/electric.png'),
            route: 'p',
            title: 'Electricidad y Magnetismo',
            formulas: FormulaArguments(
              tilesColor: colors.physics[3],
              formulas: {
                'Ley de Coulomb': [
                  AssetImage('assets/img/formulas/Coulomb.PNG'),
                  AssetImage('assets/img/params/Coulomb.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Fuerza Eléctrica 1',
                      params: {
                        Param(name: 'Primera Carga'): 1.0,
                        Param(name: 'Segunda Carga'): 1.0,
                        Param(name: 'Distancia entre Cargas'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double q1 = m['Primera Carga'];
                        double q2 = m['Segunda Carga'];
                        double r = m['Distancia entre Cargas'];

                        return (9 * pow(10, 9)) * ((q1 * q2).abs() / (r * r));
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Fuerza Eléctrica 2',
                      params: {
                        Param(name: 'Campo Eléctrico'): 1.0,
                        Param(name: 'Carga'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
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
                      params: {
                        Param(name: 'Fuerza Eléctrica'): 1.0,
                        Param(name: 'Carga'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double f = m['Fuerza Eléctrica'];
                        double q = m['Carga'];

                        return f / q;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Campo Eléctrico 2',
                      params: {
                        Param(name: 'Carga'): 1.0,
                        Param(name: 'Distancia hacia el punto'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
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
                      resultUnit: EPotential(),
                      pageName: 'Voltaje',
                      params: {
                        Param(name: 'Carga'): 1.0,
                        Param(name: 'Distancia hacia el punto'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQ = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double q = m.keys.toList()[0].getValue(inputQ);
                        double r = m.keys.toList()[1].getValue(inputR);

                        return ((9 * pow(10, 9)) * (q / r));
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: EIntensity(),
                      pageName: 'Intensidad Eléctrica',
                      params: {
                        Param(name: 'Carga', med: ECharge()): 1.0,
                        Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQ = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double q = m.keys.toList()[0].getValue(inputQ);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return q / t;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Resistence(),
                      pageName: 'Resistencia',
                      params: {
                        Param(name: 'Resistividad del Material'): 1.0,
                        Param(name: 'Longitud del Cable', med: Length()): 1.0,
                        Param(
                          name: 'Area (círculo) del (cilíndro) Cable',
                          med: Area(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL = m.values.toList()[1];
                        double inputA = m.values.toList()[2];

                        double r = m.values.toList()[0];
                        double l = m.keys.toList()[1].getValue(inputL);
                        double a = m.keys.toList()[2].getValue(inputA);

                        return r * l / a;
                      },
                    ),
                    FormulaButtonArguments(
                      resultsSystem: ['V', 'A', 'Ω'],
                      bIsTriangle: true,
                      pageName: 'VIR',
                      params: {
                        Param(
                          name: 'Voltaje o Potencial Eléctrico',
                          med: EPotential(),
                        ): 0.0,
                        Param(
                          name: 'Intensidad Eléctrica',
                          med: EIntensity(),
                        ): 0.0,
                        Param(name: 'Resistencia', med: Resistence()): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV = m.values.toList()[0];
                        double inputI = m.values.toList()[1];
                        double inputR = m.values.toList()[2];

                        double v = m.keys.toList()[0].getValue(inputV);
                        double i = m.keys.toList()[1].getValue(inputI);
                        double r = m.keys.toList()[2].getValue(inputR);

                        if (v == 0) return i * r;
                        if (i == 0) return v / r;
                        if (r == 0) return v / i;
                        return 0.0;
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
                      params: {
                        Param(name: 'Voltaje Total'): 1.0,
                        Param(name: 'Intensidad Eléctrica'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
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
                      params: {
                        Param(name: 'Sumatoria del inverso de las Resistencias'):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double er =
                            m['Sumatoria del inverso de las Resistencias'];

                        return 1 / er;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Resistencia Total 2',
                      params: {
                        Param(name: 'Resistencia 1'): 1.0,
                        Param(name: 'Resistencia 2'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double r1 = m['Resistencia 1'];
                        double r2 = m['Resistencia 2'];

                        return (r1 + r2) / (r1 * r2);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Potencia Eléctrica',
                      params: {
                        Param(name: 'Voltaje'): 1.0,
                        Param(name: 'Intensidad Eléctrica Total'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double v = m['Voltaje'];
                        double it = m['Intensidad Eléctrica Total'];

                        return v * it;
                      },
                    ),
                  ],
                ],
                'Ley de Watt': [
                  AssetImage('assets/img/formulas/Watt.PNG'),
                  AssetImage('assets/img/params/Watt.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Potencia Eléctrica',
                      params: {
                        Param(name: 'Voltaje'): 1.0,
                        Param(name: 'Intensidad Eléctrica'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double v = m['Voltaje'];
                        double i = m['Intensidad Eléctrica'];

                        return v * i;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Energía Consumida (kWh)',
                      params: {
                        Param(name: 'Potencia Eléctrica (W)'): 1.0,
                        Param(name: 'Tiempo Activo (h)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
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
}
