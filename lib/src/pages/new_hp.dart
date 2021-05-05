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
            _createMath(),
            _createPhysics(),
            _createQuimics(),
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

  Widget _createMath() {
    return CourseTileWidget(
      CourseArguments(
        color: colors.math[0],
        img: AssetImage('assets/img/matematica.png'),
        route: 'math',
        title: 'Matemáticas',
        contentsColor: colors.math[1],
        contents: [
          ContentArguments(
            ftColor: colors.math[2],
            img: AssetImage('assets/img/numbers.png'),
            route: 'm',
            title: 'Números',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Porcentaje': [
                  AssetImage('assets/img/mathformulas/porcentaje.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Porcentaje',
                      params: {
                        Param(name: 'X'): 1.0,
                        Param(name: 'Y'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double x = m.values.toList()[0];
                        double y = m.values.toList()[1];

                        return (x * y) / 100;
                      },
                    ),
                  ],
                ],
                'Potencias': [
                  AssetImage('assets/img/mathformulas/potencias.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Raices': [
                  AssetImage('assets/img/mathformulas/raices.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Logaritmos': [
                  AssetImage('assets/img/mathformulas/log.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.math[2],
            img: AssetImage('assets/img/alg.png'),
            route: 'm',
            title: 'Álgebra',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Suma y Resta': [
                  AssetImage('assets/img/mathformulas/syr.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Multiplicación': [
                  AssetImage('assets/img/mathformulas/mult.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'División': [
                  AssetImage('assets/img/mathformulas/div.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/algebra.png'),
            route: 'm',
            title: 'Factorización',
            ftColor: colors.math[2],
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Factor Común': [
                  AssetImage('assets/img/mathformulas/facomun.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Trinomio Notable': [
                  AssetImage('assets/img/mathformulas/trinqadper.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Suma de Cuadrados': [
                  AssetImage('assets/img/mathformulas/sqad.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Diferencia de Cuadrados': [
                  AssetImage('assets/img/mathformulas/difqad.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Suma de Cubos': [
                  AssetImage('assets/img/mathformulas/scubos.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Diferencia de Cubos': [
                  AssetImage('assets/img/mathformulas/difcubos.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Trinomio de la Forma': [
                  AssetImage('assets/img/mathformulas/trinfor.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Polinomio de la Forma': [
                  AssetImage('assets/img/mathformulas/polifor.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            ftColor: colors.math[2],
            img: AssetImage('assets/img/equations.png'),
            route: 'm',
            title: 'Ecuaciones',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Propiedades: Ecuaciones': [
                  AssetImage('assets/img/mathformulas/eqprops.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Propiedades: Incuaciones': [
                  AssetImage('assets/img/mathformulas/ineqprops.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Ecuación Cuadrática': [
                  AssetImage('assets/img/mathformulas/fg.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Solución X\u2081',
                      params: {
                        Param(name: 'a'): 1.0,
                        Param(name: 'b'): 1.0,
                        Param(name: 'c'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double a = m.values.toList()[0];
                        double b = m.values.toList()[1];
                        double c = m.values.toList()[2];

                        return (-b + sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Solución X\u2082',
                      params: {
                        Param(name: 'a'): 1.0,
                        Param(name: 'b'): 1.0,
                        Param(name: 'c'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double a = m.values.toList()[0];
                        double b = m.values.toList()[1];
                        double c = m.values.toList()[2];

                        return (-b - sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/function.png'),
            route: 'm',
            title: 'Funciones',
            ftColor: colors.math[2],
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Función Lineal': [
                  AssetImage('assets/img/mathformulas/flineal.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Función Afín': [
                  AssetImage('assets/img/mathformulas/fafin.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Función Cuadrática': [
                  AssetImage('assets/img/mathformulas/fqad.PNG'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Pendiente': [
                  AssetImage('assets/img/mathformulas/pend.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Pendiente',
                      params: {
                        Param(name: 'y\u2082'): 1.0,
                        Param(name: 'y\u2081'): 1.0,
                        Param(name: 'x\u2082'): 1.0,
                        Param(name: 'x\u2081'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double y2 = m.values.toList()[0];
                        double y1 = m.values.toList()[1];
                        double x2 = m.values.toList()[2];
                        double x1 = m.values.toList()[3];

                        return (y2 - y1) / (x2 - x1);
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/stats.png'),
            route: 'm',
            title: 'Estadística',
            ftColor: colors.math[2],
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Media': [
                  AssetImage('assets/img/mathformulas/media.png'),
                  AssetImage('assets/img/mathformulas/mparams.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Media',
                      params: {
                        Param(name: 'Sumatoria de los Datos'): 1.0,
                        Param(name: 'Número de Datos'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double ex = m.values.toList()[0];
                        double n = m.values.toList()[1];

                        return ex / n;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Media en Datos Agrupados',
                      params: {
                        Param(name: 'Sumatoria de los Datos x Frecuencia'): 1.0,
                        Param(name: 'Número de Datos'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double exf = m.values.toList()[0];
                        double n = m.values.toList()[1];

                        return exf / n;
                      },
                    ),
                  ],
                ],
                'Rango': [
                  AssetImage('assets/img/mathformulas/rango.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Rango',
                      params: {
                        Param(name: 'Dato Superior'): 2.0,
                        Param(name: 'Dato Inferior'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double ds = m.values.toList()[0];
                        double di = m.values.toList()[1];

                        return (ds - di).abs();
                      },
                    ),
                  ],
                ],
                'Marca de Clase': [
                  AssetImage('assets/img/mathformulas/mc.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Marca de Clase',
                      params: {
                        Param(name: 'Limite Superior'): 2.0,
                        Param(name: 'Limite Inferior'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double ls = m.values.toList()[0];
                        double li = m.values.toList()[1];

                        return (li + ls) / 2;
                      },
                    ),
                  ],
                ],
                'Mediana': [
                  AssetImage('assets/img/mathformulas/mediana.PNG'),
                  AssetImage('assets/img/mathformulas/pmediana.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Mediana',
                      params: {
                        Param(name: 'Número de Datos'): 2.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();

                        return (n + 1) / 2;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Mediana en Datos Agrupados',
                      params: {
                        Param(name: 'Li del intervalo de la Media'): 1.0,
                        Param(name: 'Número de Datos'): 1.0,
                        Param(name: 'f del intervalo de la Media'): 1.0,
                        Param(name: 'f del intervalo anterior al de la Media'):
                            1.0,
                        Param(name: 'Amplitud del intervalo de la Media'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double li = m.values.toList()[0];
                        double n = m.values.toList()[1];
                        double fi = m.values.toList()[2];
                        double fim1 = m.values.toList()[3];
                        double a = m.values.toList()[4];

                        return li + (((n / 2) - fim1) / fi) * a;
                      },
                    ),
                  ],
                ],
                'Moda': [
                  AssetImage('assets/img/mathformulas/moda.PNG'),
                  AssetImage('assets/img/mathformulas/pmoda.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Moda en Datos Agrupados',
                      params: {
                        Param(name: 'Li del intervalo de la Media'): 1.0,
                        Param(name: 'f del intervalo de la Media'): 1.0,
                        Param(name: 'f del intervalo posterior al de la Media'):
                            1.0,
                        Param(name: 'f del intervalo anterior al de la Media'):
                            1.0,
                        Param(name: 'Amplitud del intervalo de la Media'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double li = m.values.toList()[0];
                        double fi = m.values.toList()[1];
                        double fip1 = m.values.toList()[2];
                        double fim1 = m.values.toList()[3];
                        double a = m.values.toList()[4];

                        return li +
                            ((fi - fim1) / ((fi - fim1) + (fi - fip1))) * a;
                      },
                    ),
                  ],
                ],
                'Cuantiles (Posición)': [
                  AssetImage('assets/img/mathformulas/qantiles.PNG'),
                  AssetImage('assets/img/mathformulas/nk.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Cuartil',
                      params: {
                        Param(name: 'Número de Datos'): 1.0,
                        Param(name: 'Cuartil a Calcular (1-3)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (k > 3 || k < 1) return 0.0;

                        return ((n + 1) * k) / 4;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Quintil',
                      params: {
                        Param(name: 'Número de Datos'): 1.0,
                        Param(name: 'Quintil a Calcular (1-4)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (k > 4 || k < 1) return 0.0;

                        return ((n + 1) * k) / 5;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Decil',
                      params: {
                        Param(name: 'Número de Datos'): 1.0,
                        Param(name: 'Decil a Calcular (1-4)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (k > 9 || k < 1) return 0.0;

                        return ((n + 1) * k) / 10;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Percentil',
                      params: {
                        Param(name: 'Número de Datos'): 1.0,
                        Param(name: 'Percentil a Calcular (1-99)'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (k > 99 || k < 1) return 0.0;

                        return ((n + 1) * k) / 100;
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/prob.png'),
            route: 'm',
            title: 'Probabilidad',
            ftColor: colors.math[2],
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Probabilidad': [
                  AssetImage('assets/img/mathformulas/prob.PNG'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Probabilidad',
                      params: {
                        Param(name: 'Resultados Favorables'): 1.0,
                        Param(name: 'Resultados Posibles'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double rf = m.values.toList()[0];
                        double rp = m.values.toList()[1];

                        return (rf / rp) * 100;
                      },
                    ),
                  ],
                ],
                'Variación': [
                  AssetImage('assets/img/mathformulas/var.PNG'),
                  AssetImage('assets/img/mathformulas/varp.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Variación',
                      params: {
                        Param(name: 'Elementos totales'): 2.0,
                        Param(name: 'Elementos tomados'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (n <= 0 || k <= 0 || n < k) return 0.0;

                        return ((factorial(n)) / (factorial(n - k))).toDouble();
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Varianza con Repetición',
                      params: {
                        Param(name: 'Elementos totales'): 2.0,
                        Param(name: 'Elementos tomados'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (n <= 0 || k <= 0 || n < k) return 0.0;

                        return pow(n, k).toDouble();
                      },
                    ),
                  ],
                ],
                'Permutación': [
                  AssetImage('assets/img/mathformulas/per.PNG'),
                  AssetImage('assets/img/mathformulas/perp.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Permutación',
                      params: {
                        Param(name: 'Elementos totales'): 2.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();

                        if (n <= 0) return 0.0;

                        return factorial(n).toDouble();
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Permutación Circular',
                      params: {
                        Param(name: 'Elementos totales'): 2.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();

                        if (n <= 0) return 0.0;

                        return factorial(n - 1).toDouble();
                      },
                    ),
                  ],
                ],
                'Combinación': [
                  AssetImage('assets/img/mathformulas/com.PNG'),
                  AssetImage('assets/img/mathformulas/varp.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Combinación',
                      params: {
                        Param(name: 'Elementos totales'): 2.0,
                        Param(name: 'Elementos tomados'): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        int n = m.values.toList()[0].floor();
                        int k = m.values.toList()[1].floor();

                        if (n <= 0 || k <= 0 || n < k) return 0.0;

                        return ((factorial(n)) /
                                ((factorial(k)) * (factorial(n - k))))
                            .toDouble();
                      },
                    ),
                  ],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/angle.png'),
            route: 'm',
            ftColor: colors.math[2],
            title: 'Ángulos',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Opuestos por Vértice': [
                  AssetImage('assets/img/mathformulas/op.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Paralelas Cortadas': [
                  AssetImage('assets/img/mathformulas/par.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/geometry.png'),
            route: 'm',
            ftColor: colors.math[2],
            title: 'Figuras 2D',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Áreas': [
                  AssetImage('assets/img/mathformulas/areas.png'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Cuadrado',
                      params: {
                        Param(name: 'l'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double l = m.values.toList()[0];

                        return pow(l, 2);
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Rectángulo/Romboide',
                      params: {
                        Param(name: 'b'): 1,
                        Param(name: 'a'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double b = m.values.toList()[0];
                        double a = m.values.toList()[1];

                        return b * a;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Triángulo',
                      params: {
                        Param(name: 'b'): 1,
                        Param(name: 'a'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double b = m.values.toList()[0];
                        double a = m.values.toList()[1];

                        return (b * a) / 2;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Rombo',
                      params: {
                        Param(name: 'D'): 1,
                        Param(name: 'd'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double d1 = m.values.toList()[0];
                        double d2 = m.values.toList()[1];

                        return (d1 * d2) / 2;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Trapezoide',
                      params: {
                        Param(name: 'B'): 1,
                        Param(name: 'b'): 1,
                        Param(name: 'a'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double bi = m.values.toList()[0];
                        double b = m.values.toList()[1];
                        double a = m.values.toList()[2];

                        return ((bi + b) * a) / 2;
                      },
                    ),
                  ],
                ],
                'Polígonos Regulares': [
                  AssetImage('assets/img/mathformulas/pol.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Trapecios': [
                  AssetImage('assets/img/mathformulas/trap.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Cuadriláteros': [
                  AssetImage('assets/img/mathformulas/cuadr.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Deltoide': [
                  AssetImage('assets/img/mathformulas/delt.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/triangle.png'),
            route: 'm',
            ftColor: colors.math[2],
            title: 'Triángulos',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Clasificación': [
                  AssetImage('assets/img/mathformulas/clas.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Criterios de Semejanza': [
                  AssetImage('assets/img/mathformulas/sem.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Teorema de Pitágoras': [
                  AssetImage('assets/img/mathformulas/pitag.png'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultsSystem: ['H', 'A', 'B'],
                      triangleColor: Colors.blue,
                      bIsTriangle: true,
                      pageName: 'Pitágoras',
                      params: {
                        Param(name: 'Hipotenusa'): 0,
                        Param(name: 'Cateto A'): 0,
                        Param(name: 'Cateto B'): 0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputH = m.values.toList()[0];
                        double inputA = m.values.toList()[1];
                        double inputB = m.values.toList()[2];

                        double h = m.keys.toList()[0].getValue(inputH);
                        double a = m.keys.toList()[1].getValue(inputA);
                        double b = m.keys.toList()[2].getValue(inputB);

                        if (h == 0) return sqrt(pow(a, 2) + pow(b, 2));
                        if (a == 0) return sqrt(pow(h, 2) - pow(b, 2));
                        if (b == 0) return sqrt(pow(h, 2) - pow(a, 2));
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Teorema de Tales': [
                  AssetImage('assets/img/mathformulas/tales.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Teorema de Ángulos': [
                  AssetImage('assets/img/mathformulas/ang.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Bisectriz': [
                  AssetImage('assets/img/mathformulas/bis.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Incentro': [
                  AssetImage('assets/img/mathformulas/incentro.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Transversal de Gravedad': [
                  AssetImage('assets/img/mathformulas/tdg.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Simetral': [
                  AssetImage('assets/img/mathformulas/simetr.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Circuncentro': [
                  AssetImage('assets/img/mathformulas/cc.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
                'Mediana': [
                  AssetImage('assets/img/mathformulas/medianat.png'),
                  null,
                  <FormulaButtonArguments>[],
                ],
              },
            ),
          ),
          ContentArguments(
            img: AssetImage('assets/img/ci.png'),
            route: 'm',
            ftColor: colors.math[2],
            title: 'Círculos',
            formulas: FormulaArguments(
              tilesColor: colors.math[3],
              formulas: {
                'Círculo': [
                  AssetImage('assets/img/mathformulas/circle.png'),
                  null,
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      pageName: 'Perímetro',
                      params: {
                        Param(name: 'r'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double r = m.values.toList()[0];

                        return 2 * pi * r;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Área',
                      params: {
                        Param(name: 'r'): 1,
                      },
                      formula: (Map<Param, double> m) {
                        double r = m.values.toList()[0];

                        return pi * r * r;
                      },
                    ),
                  ],
                ],
                'Sector Circular': [
                  AssetImage('assets/img/mathformulas/sector.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulo de Centro': [
                  AssetImage('assets/img/mathformulas/dc.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulo Inscrito': [
                  AssetImage('assets/img/mathformulas/insc.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulo Semi-Inscrito': [
                  AssetImage('assets/img/mathformulas/asi.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulo Interior': [
                  AssetImage('assets/img/mathformulas/int.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulo Exterior': [
                  AssetImage('assets/img/mathformulas/ext.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulos Inscritos y de Centro': [
                  AssetImage('assets/img/mathformulas/angulos.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Líneas Paralelas': [
                  AssetImage('assets/img/mathformulas/lpar.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Ángulos Inscritos': [
                  AssetImage('assets/img/mathformulas/ins.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Inscritos en Semicírculo': [
                  AssetImage('assets/img/mathformulas/smi.png'),
                  null,
                  <FormulaButtonArguments>[]
                ],
                'Cuadrilátero Inscrito': [
                  AssetImage('assets/img/mathformulas/cuadins.png'),
                  null,
                  <FormulaButtonArguments>[]
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

                        double x1 = m.keys.toList()[0].getValue(inputx1);
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
                        Param(name: 'Velocidad Final', med: Time()): 1.0,
                        Param(name: 'Velocidad Inicial', med: Time()): 0.0,
                        Param(name: 'Gravedad', med: Aceleration()): 9.8,
                      },
                      formula: (Map<Param, double> m) {
                        double inputVF = m.values.toList()[0];
                        double inputV0 = m.values.toList()[1];
                        double inputG = m.values.toList()[2];

                        double vf = m.keys.toList()[0].getValue(inputVF);
                        double v0 = m.keys.toList()[1].getValue(inputV0);
                        double g = m.keys.toList()[2].getValue(inputG);

                        return (vf - v0) / g;
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
                      resultUnit: Energy(),
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
                      resultUnit: Power(),
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
                      resultUnit: Power(),
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
                          name: 'Temperatura Final',
                          med: Temperature(),
                        ): 1.0,
                        Param(
                          name: 'Temperatura Inicial',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputM = m.values.toList()[0];
                        double inputTF = m.values.toList()[2];

                        double inputT0 = m.values.toList()[3];

                        double ma = m.keys.toList()[0].getValue(inputM);
                        double c = m.values.toList()[1];
                        double tf = m.keys.toList()[2].temp(inputTF);

                        double t0 = m.keys.toList()[3].temp(inputT0);

                        return ma * c * (tf - t0);
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
                        Param(name: 'Calor Final', med: Energy()): 1.0,
                        Param(name: 'Calor Inicial', med: Energy()): 1.0,
                        Param(
                          name: 'Temperatura Final',
                          med: Temperature(),
                        ): 1.0,
                        Param(
                          name: 'Temperatura Inicial',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQF = m.values.toList()[0];
                        double inputQ0 = m.values.toList()[1];
                        double inputTF = m.values.toList()[2];
                        double inputT0 = m.values.toList()[3];

                        double qf = m.keys.toList()[0].getValue(inputQF);
                        double q0 = m.keys.toList()[1].getValue(inputQ0);
                        double tf = m.keys.toList()[2].temp(inputTF);
                        double t0 = m.keys.toList()[3].temp(inputT0);

                        return (qf - q0) / (tf - t0);
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
                          name: 'Temperatura Final',
                          med: Temperature(),
                        ): 1.0,
                        Param(
                          name: 'Temperatura Inicial',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputL0 = m.values.toList()[0];
                        double inputTF = m.values.toList()[2];
                        double inputT0 = m.values.toList()[3];

                        double lo = m.keys.toList()[0].getValue(inputL0);
                        double a = m.values.toList()[1];
                        double tf = m.keys.toList()[2].temp(inputTF);
                        double t0 = m.keys.toList()[3].temp(inputT0);

                        return lo * a * (tf - t0);
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
                          name: 'Temperatura Final',
                          med: Temperature(),
                        ): 1.0,
                        Param(
                          name: 'Temperatura Inicial',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputS0 = m.values.toList()[0];
                        double inputTF = m.values.toList()[2];
                        double inputT0 = m.values.toList()[3];

                        double so = m.keys.toList()[0].getValue(inputS0);
                        double b = m.values.toList()[1];
                        double tf = m.keys.toList()[2].temp(inputTF);
                        double t0 = m.keys.toList()[3].temp(inputT0);

                        return so * b * (tf - t0);
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
                          name: 'Temperatura Final',
                          med: Temperature(),
                        ): 1.0,
                        Param(
                          name: 'Temperatura Inicial',
                          med: Temperature(),
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputV0 = m.values.toList()[0];
                        double inputTF = m.values.toList()[2];
                        double inputT0 = m.values.toList()[3];

                        double vo = m.keys.toList()[0].getValue(inputV0);
                        double g = m.values.toList()[1];
                        double tf = m.keys.toList()[2].temp(inputTF);
                        double t0 = m.keys.toList()[3].temp(inputT0);

                        return vo * g * (tf - t0);
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
                      resultUnit: Force(),
                      pageName: 'Fuerza Eléctrica 1',
                      params: {
                        Param(name: 'Primera Carga', med: Charge()): 1.0,
                        Param(name: 'Segunda Carga', med: Charge()): 1.0,
                        Param(name: 'Distancia entre Cargas', med: Length()):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQ1 = m.values.toList()[0];
                        double inputQ2 = m.values.toList()[1];
                        double inputR = m.values.toList()[2];

                        double q1 = m.keys.toList()[0].getValue(inputQ1);
                        double q2 = m.keys.toList()[1].getValue(inputQ2);
                        double r = m.keys.toList()[2].getValue(inputR);

                        return (9e+9) * ((q1 * q2).abs() / (pow(r, 2)));
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Fuerza Eléctrica 2',
                      params: {
                        Param(name: 'Campo Eléctrico'): 1.0,
                        Param(name: 'Carga', med: Charge()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputE = m.values.toList()[0];
                        double inputQ = m.values.toList()[1];

                        double e = m.keys.toList()[0].getValue(inputE);
                        double q = m.keys.toList()[1].getValue(inputQ);

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
                        Param(name: 'Fuerza Eléctrica', med: Force()): 1.0,
                        Param(name: 'Carga', med: Charge()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputF = m.values.toList()[0];
                        double inputQ = m.values.toList()[1];

                        double f = m.keys.toList()[0].getValue(inputF);
                        double q = m.keys.toList()[1].getValue(inputQ);

                        return f / q;
                      },
                    ),
                    FormulaButtonArguments(
                      pageName: 'Campo Eléctrico 2',
                      params: {
                        Param(name: 'Carga', med: Charge()): 1.0,
                        Param(name: 'Distancia hacia el punto', med: Length()):
                            1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputQ = m.values.toList()[0];
                        double inputR = m.values.toList()[1];

                        double q = m.keys.toList()[0].getValue(inputQ);
                        double r = m.keys.toList()[1].getValue(inputR);

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
                        Param(name: 'Carga', med: Charge()): 1.0,
                        Param(
                          name: 'Distancia hacia el punto',
                          med: Length(),
                        ): 1.0,
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
                        Param(name: 'Carga', med: Charge()): 1.0,
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
                        Param(
                            name: 'Resistividad (=1 si usas Mat)',
                            med: MatResistivity()): 1.0,
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
                      bIsTriangle: true,
                      resultsSystem: ['W', 'V', 'A'],
                      pageName: 'Potencia Eléctrica',
                      params: {
                        Param(name: 'Potencia', med: Power()): 0.0,
                        Param(name: 'Voltaje Total', med: EPotential()): 0.0,
                        Param(
                          name: 'Intensidad Eléctrica',
                          med: EIntensity(),
                        ): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputP = m.values.toList()[0];
                        double inputV = m.values.toList()[1];
                        double inputI = m.values.toList()[2];

                        double p = m.keys.toList()[0].getValue(inputP);
                        double v = m.keys.toList()[1].getValue(inputV);
                        double i = m.keys.toList()[2].getValue(inputI);

                        if (p == 0) return v * i;
                        if (v == 0) return p / i;
                        if (i == 0) return p / v;
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Circuitos en Paralelo': [
                  AssetImage('assets/img/formulas/EnParalelo.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      resultUnit: Resistence(),
                      pageName: 'Resistencia Total 1',
                      params: {
                        Param(
                          name: 'Sumatoria del inverso de las Resistencias',
                        ): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double er = m.values.toList()[0];

                        return 1 / er;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Resistence(),
                      pageName: 'Resistencia Total 2',
                      params: {
                        Param(name: 'Resistencia 1', med: Resistence()): 1.0,
                        Param(name: 'Resistencia 2', med: Resistence()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputR1 = m.values.toList()[0];
                        double inputR2 = m.values.toList()[1];

                        double r1 = m.keys.toList()[0].getValue(inputR1);
                        double r2 = m.keys.toList()[1].getValue(inputR2);

                        return (r1 * r2) / (r1 + r2);
                      },
                    ),
                    FormulaButtonArguments(
                      bIsTriangle: true,
                      resultsSystem: ['W', 'V', 'A'],
                      pageName: 'Potencia Eléctrica',
                      params: {
                        Param(name: 'Potencia'): 0.0,
                        Param(name: 'Voltaje', med: EPotential()): 0.0,
                        Param(name: 'Intensidad Total', med: EIntensity()): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputP = m.values.toList()[0];
                        double inputV = m.values.toList()[1];
                        double inputI = m.values.toList()[2];

                        double p = m.keys.toList()[0].getValue(inputP);
                        double v = m.keys.toList()[1].getValue(inputV);
                        double i = m.keys.toList()[2].getValue(inputI);

                        if (p == 0) return v * i;
                        if (v == 0) return p / i;
                        if (i == 0) return p / v;
                        return 0.0;
                      },
                    ),
                  ],
                ],
                'Ley de Watt': [
                  AssetImage('assets/img/formulas/Watt.PNG'),
                  AssetImage('assets/img/params/Watt.PNG'),
                  <FormulaButtonArguments>[
                    FormulaButtonArguments(
                      bIsTriangle: true,
                      resultsSystem: ['W', 'V', 'A'],
                      pageName: 'Potencia Eléctrica',
                      params: {
                        Param(name: 'Potencia', med: Power()): 0.0,
                        Param(name: 'Voltaje', med: EPotential()): 0.0,
                        Param(name: 'Intensidad Total', med: EIntensity()): 0.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputP = m.values.toList()[0];
                        double inputV = m.values.toList()[1];
                        double inputI = m.values.toList()[2];

                        double p = m.keys.toList()[0].getValue(inputP);
                        double v = m.keys.toList()[1].getValue(inputV);
                        double i = m.keys.toList()[2].getValue(inputI);

                        if (p == 0) return v * i;
                        if (v == 0) return p / i;
                        if (i == 0) return p / v;
                        return 0.0;
                      },
                    ),
                    FormulaButtonArguments(
                      resultUnit: Energy(),
                      pageName: 'Energía Consumida',
                      params: {
                        Param(name: 'Potencia Eléctrica', med: Power()): 1.0,
                        Param(name: 'Tiempo Activo', med: Time()): 1.0,
                      },
                      formula: (Map<Param, double> m) {
                        double inputP = m.values.toList()[0];
                        double inputT = m.values.toList()[1];

                        double p = m.keys.toList()[0].getValue(inputP);
                        double t = m.keys.toList()[1].getValue(inputT);

                        return p * t;
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
        color: colors.quimics[0],
        img: AssetImage('assets/img/quimica.png'),
        route: 'quimics',
        title: 'Química',
        contentsColor: colors.quimics[1],
        contents: [],
      ),
    );
  }

  int factorial(int n) {
    if (n < 0) throw ('Negative numbers are not allowed.');
    return n <= 1 ? 1 : n * factorial(n - 1);
  }
}
