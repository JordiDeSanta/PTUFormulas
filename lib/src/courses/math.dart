import 'dart:math';

import 'package:ezformulas/src/providers/_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

final math = CourseArguments(
  title: 'Matemáticas',
  contents: [
    ContentArguments(
      title: 'Números',
      icon: FontAwesomeIcons.squareRootAlt,
      formulas: [
        FormulaArguments(
          char: '%',
          name: 'Porcentaje',
          svgRoute: 'assets/formulas/math/Numbers/Porcentaje.svg',
        ),
        FormulaArguments(
          char: 'x\u00B2',
          name: 'Potencias',
          imgRoute: 'assets/formulas/math/Numbers/Potencias.png',
        ),
        FormulaArguments(
          char: '√',
          name: 'Raíces',
          imgRoute: 'assets/formulas/math/Numbers/Raices.png',
        ),
        FormulaArguments(
          char: 'log',
          name: 'Logaritmos',
          imgRoute: 'assets/formulas/math/Numbers/Logaritmos.png',
        ),
        FormulaArguments(
          char: '|a|',
          name: 'Muy importante',
          imgRoute: 'assets/formulas/math/Numbers/Importante.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Intereses',
      icon: FontAwesomeIcons.moneyBill,
      formulas: [
        FormulaArguments(
          char: 'i',
          name: 'Interés Simple',
          imgRoute: 'assets/formulas/math/Economy/Simple.png',
          params: {
            Param(name: 'Capital Inicial'): 1.0,
            Param(name: 'Periodos Transcurridos'): 1.0,
            Param(name: 'Interes (%)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double c = m.values.toList()[0];
            double n = m.values.toList()[1];
            double i = m.values.toList()[2];

            return c + (n * i * c / 100);
          },
        ),
        FormulaArguments(
          char: 'i',
          name: 'Interés Compuesto',
          imgRoute: 'assets/formulas/math/Economy/Compuesto.png',
          params: {
            Param(name: 'Capital Inicial'): 1.0,
            Param(name: 'Periodos Transcurridos'): 1.0,
            Param(name: 'Interes (%)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double c = m.values.toList()[0];
            double n = m.values.toList()[1];
            double i = m.values.toList()[2];

            return c * pow(1 + i / 100, n);
          },
        ),
      ],
    ),
    ContentArguments(
      title: 'Productos Notables y Factorización',
      icon: FontAwesomeIcons.superscript,
      formulas: [
        FormulaArguments(
          char: '',
          name: 'Cuadrado de Binomio',
          svgRoute: 'assets/formulas/math/Facto/CDB.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Suma por Diferencia',
          svgRoute: 'assets/formulas/math/Facto/SPD.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Cubo de Binomio',
          svgRoute: 'assets/formulas/math/Facto/CBDB.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Binomio con Término Común',
          svgRoute: 'assets/formulas/math/Facto/BCTC.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Cuadrado de Trinomio',
          svgRoute: 'assets/formulas/math/Facto/CDT.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Término Común',
          svgRoute: 'assets/formulas/math/Facto/TC.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Suma de Cubos',
          svgRoute: 'assets/formulas/math/Facto/SDC.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Diferencia de Cubos',
          svgRoute: 'assets/formulas/math/Facto/DDC.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Ecuación de la Recta',
      icon: FontAwesomeIcons.gripLines,
      formulas: [
        FormulaArguments(
          char: 'd',
          name: 'Distancia entre 2 puntos',
          imgRoute: 'assets/formulas/math/Rect/Distancia.png',
          params: {
            Param(name: 'x\u2082'): 1.0,
            Param(name: 'x\u2081'): 1.0,
            Param(name: 'y\u2082'): 1.0,
            Param(name: 'y\u2081'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double x2 = m.values.toList()[0];
            double x1 = m.values.toList()[1];
            double y2 = m.values.toList()[2];
            double y1 = m.values.toList()[3];

            return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
          },
        ),
        FormulaArguments(
          char: 'm',
          name: 'Punto Medio entre 2 puntos',
          svgRoute: 'assets/formulas/math/Rect/PuntoMedio.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Funciones',
      text: 'f(x)',
      formulas: [
        FormulaArguments(
          char: 'f',
          name: 'Función Lineal',
          svgRoute: 'assets/formulas/math/Functions/FuncionLineal.svg',
        ),
        FormulaArguments(
          char: 'm',
          name: 'Pendiente',
          svgRoute: 'assets/formulas/math/Functions/Pendiente.svg',
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
        FormulaArguments(
          char: 'f',
          name: 'Función Afín',
          svgRoute: 'assets/formulas/math/Functions/FuncionAfin.svg',
        ),
        FormulaArguments(
          char: 'x\u00B2',
          name: 'Función Cuadrática',
          svgRoute: 'assets/formulas/math/Functions/FuncionCuadratica.svg',
        ),
        FormulaArguments(
          char: '-',
          name: 'Líneas',
          svgRoute: 'assets/formulas/math/Functions/Lineas.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Ecuación Cuadrática',
      text: 'x\u00B2',
      formulas: [
        FormulaArguments(
          char: 'f',
          name: 'Función Lineal',
          svgRoute: 'assets/formulas/math/Functions/FuncionLineal.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Sistema de Ecuaciones',
      text: 'x+y',
      formulas: [
        FormulaArguments(
          char: '|',
          name: 'Fórmula General',
          svgRoute: 'assets/formulas/math/System/General.svg',
        ),
        FormulaArguments(
          char: 's',
          name: 'Análisis',
          svgRoute: 'assets/formulas/math/System/Analisis.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Estadística',
      text: '%',
      formulas: [
        FormulaArguments(
          char: 'x',
          name: 'Media Aritmética',
          svgRoute: 'assets/formulas/math/Statistics/Media.svg',
        ),
        FormulaArguments(
          char: 'Mo',
          name: 'Moda',
          svgRoute: 'assets/formulas/math/Statistics/Moda.svg',
          params: {
            Param(name: 'Li del intervalo de la Media'): 1.0,
            Param(name: 'f del intervalo de la Media'): 1.0,
            Param(name: 'f del intervalo posterior al de la Media'): 1.0,
            Param(name: 'f del intervalo anterior al de la Media'): 1.0,
            Param(name: 'Amplitud del intervalo de la Media'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double li = m.values.toList()[0];
            double fi = m.values.toList()[1];
            double fip1 = m.values.toList()[2];
            double fim1 = m.values.toList()[3];
            double a = m.values.toList()[4];

            return li + ((fi - fim1) / ((fi - fim1) + (fi - fip1))) * a;
          },
        ),
        FormulaArguments(
          char: 'Me',
          name: 'Mediana',
          svgRoute: 'assets/formulas/math/Statistics/Mediana.svg',
          params: {
            Param(name: 'Li del intervalo de la Media'): 1.0,
            Param(name: 'Número de Datos'): 1.0,
            Param(name: 'f del intervalo de la Media'): 1.0,
            Param(name: 'f acum del intervalo anterior al de la Media'): 1.0,
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
    ),
  ],
);
