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
                      pageName: 'Fuerza',
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
                      pageName: 'Peso',
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
                        double f = m['Fuerza Aplicada'];
                        double a = m['Área'];

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
                      pageName: 'Presión Hidrostática',
                      params: {
                        Param(name: 'Masa', med: Mass()): 1.0,
                        Param(name: 'Volumen', med: Volumen()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double d = m['Densidad'];
                        double g = m['Gravedad'];
                        double h = m['Altura'];

                        return d * g * h;
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
                      resultUnit: Pressure(),
                      pageName: 'Presión Absoluta',
                      params: {
                        Param(name: 'Presión Hidrostática', med: Pressure()):
                            1.0,
                        Param(name: 'Presión Atmosférica', med: Pressure()):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
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
                      params: {
                        Param(name: 'Densidad', med: Density()): 1.0,
                        Param(name: 'Volumen', med: Volumen()): 1.0,
                        Param(name: 'Altura', med: Length()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
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
        ],
      ),
    );
  }
}
