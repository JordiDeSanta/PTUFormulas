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
        FormulaArguments(
          char: 'C',
          name: 'Cuantiles (Posición)',
          svgRoute: 'assets/formulas/math/Statistics/Cuantiles.svg',
        ),
        FormulaArguments(
          char: 'R',
          name: 'Rango',
          svgRoute: 'assets/formulas/math/Statistics/Rango.svg',
        ),
        FormulaArguments(
          char: 'σ',
          name: 'Desviación Estándar',
          imgRoute: 'assets/formulas/math/Statistics/Desv.png',
        ),
        FormulaArguments(
          char: 'σ\u00B2',
          name: 'Varianza',
          imgRoute: 'assets/formulas/math/Statistics/Var.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Combinatoria',
      text: '()',
      formulas: [
        FormulaArguments(
          char: 'P',
          name: 'Permutación Lineal',
          svgRoute: 'assets/formulas/math/Combinatory/Permutacion.svg',
          params: {
            Param(name: 'Elementos totales'): 2.0,
          },
          formula: (Map<Param, double> m) {
            int n = m.values.toList()[0].floor();

            if (n <= 0) return 0.0;

            return factorial(n).toDouble();
          },
        ),
        FormulaArguments(
          char: 'Pr',
          name: 'Permutación con Repetición',
          svgRoute: 'assets/formulas/math/Combinatory/PermutacionR.svg',
        ),
        FormulaArguments(
          char: 'Pc',
          name: 'Permutación Circular',
          svgRoute: 'assets/formulas/math/Combinatory/PermutacionC.svg',
          params: {
            Param(name: 'Elementos totales'): 2.0,
          },
          formula: (Map<Param, double> m) {
            int n = m.values.toList()[0].floor();

            if (n <= 0) return 0.0;

            return factorial(n - 1).toDouble();
          },
        ),
        FormulaArguments(
          char: 'V',
          name: 'Variación',
          svgRoute: 'assets/formulas/math/Combinatory/Variacion.svg',
          params: {
            Param(name: 'Elementos totales'): 1.0,
            Param(name: 'Elementos tomados'): 1.0,
          },
          formula: (Map<Param, double> m) {
            int n = m.values.toList()[0].floor();
            int k = m.values.toList()[1].floor();

            if (n <= 0 || k <= 0 || n < k) return 0.0;

            return (((factorial(n))) / ((factorial((n - k))))).toDouble();
          },
        ),
        FormulaArguments(
          char: 'Vr',
          name: 'Variación con Repetición',
          svgRoute: 'assets/formulas/math/Combinatory/VariacionR.svg',
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
        FormulaArguments(
          char: 'C',
          name: 'Combinación',
          svgRoute: 'assets/formulas/math/Combinatory/Combinacion.svg',
          params: {
            Param(name: 'Elementos totales'): 2.0,
            Param(name: 'Elementos tomados'): 1.0,
          },
          formula: (Map<Param, double> m) {
            int n = m.values.toList()[0].floor();
            int k = m.values.toList()[1].floor();

            if (n <= 0 || k <= 0 || n < k) return 0.0;

            return ((factorial(n)) / ((factorial(k)) * (factorial(n - k))))
                .toDouble();
          },
        ),
        FormulaArguments(
          char: 'Cr',
          name: 'Combinación con Repetición',
          svgRoute: 'assets/formulas/math/Combinatory/CombinacionR.svg',
        ),
        FormulaArguments(
          char: 'p',
          name: 'Propiedades',
          svgRoute: 'assets/formulas/math/Combinatory/Props.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Probabilidad',
      text: 'P(x)',
      formulas: [
        FormulaArguments(
          char: 'P',
          name: 'Regla de Laplace',
          imgRoute: 'assets/formulas/math/Probability/Laplace.png',
        ),
        FormulaArguments(
          char: 'o',
          name: 'Unión',
          svgRoute: 'assets/formulas/math/Probability/Union.svg',
        ),
        FormulaArguments(
          char: 'y',
          name: 'Intersección',
          svgRoute: 'assets/formulas/math/Probability/Inter.svg',
        ),
        FormulaArguments(
          char: 'c',
          name: 'Probabilidad Condicional',
          svgRoute: 'assets/formulas/math/Probability/Cond.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Ángulos',
      text: '<',
      formulas: [
        FormulaArguments(
          char: 'c',
          name: 'Clasificación',
          imgRoute: 'assets/formulas/math/Angles/Clasificacion.png',
        ),
        FormulaArguments(
          char: '=',
          name: 'Paralelas',
          imgRoute: 'assets/formulas/math/Angles/Paralelas.png',
        ),
        FormulaArguments(
          char: '+',
          name: 'Perpendiculares',
          imgRoute: 'assets/formulas/math/Angles/Perpendiculares.png',
        ),
        FormulaArguments(
          char: '<',
          name: 'Consecutivos',
          imgRoute: 'assets/formulas/math/Angles/Consecutivos.png',
        ),
        FormulaArguments(
          char: '<',
          name: 'Bisectriz',
          imgRoute: 'assets/formulas/math/Angles/Bisectriz.png',
        ),
        FormulaArguments(
          char: 'x',
          name: 'Secantes',
          imgRoute: 'assets/formulas/math/Angles/Secantes.png',
        ),
        FormulaArguments(
          char: 'S',
          name: 'Suplementarios',
          imgRoute: 'assets/formulas/math/Angles/Suplementarios.png',
        ),
        FormulaArguments(
          char: 'T',
          name: 'Teorema',
          imgRoute: 'assets/formulas/math/Angles/Teorema.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Triángulos',
      text: '∆',
      formulas: [
        FormulaArguments(
          char: '<',
          name: 'Ángulos',
          imgRoute: 'assets/formulas/math/Triangles/Angulos.png',
        ),
        FormulaArguments(
          char: '<',
          name: 'Clasificación',
          imgRoute: 'assets/formulas/math/Triangles/Clasificacion.png',
        ),
        FormulaArguments(
          char: '|',
          name: 'Base y Altura',
          imgRoute: 'assets/formulas/math/Triangles/BH.png',
        ),
        FormulaArguments(
          char: 'b',
          name: 'Bisectriz',
          imgRoute: 'assets/formulas/math/Triangles/Bisectriz.png',
        ),
        FormulaArguments(
          char: 'i',
          name: 'Incentro',
          imgRoute: 'assets/formulas/math/Triangles/Incentro.png',
        ),
        FormulaArguments(
          char: 's',
          name: 'Simetral',
          imgRoute: 'assets/formulas/math/Triangles/Simetral.png',
        ),
        FormulaArguments(
          char: 'c',
          name: 'Circunscentro',
          imgRoute: 'assets/formulas/math/Triangles/Circunscentro.png',
        ),
        FormulaArguments(
          char: 't',
          name: 'Transversal de Gravedad',
          imgRoute: 'assets/formulas/math/Triangles/Transversales.png',
        ),
        FormulaArguments(
          char: 'h',
          name: 'Altura',
          imgRoute: 'assets/formulas/math/Triangles/Altura.png',
        ),
        FormulaArguments(
          char: 'm',
          name: 'Mediana',
          imgRoute: 'assets/formulas/math/Triangles/Mediana.png',
        ),
        FormulaArguments(
          char: 'c',
          name: 'Casos Especiales',
          imgRoute: 'assets/formulas/math/Triangles/Casos.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Teoremas',
      text: 'T',
      formulas: [
        FormulaArguments(
          char: '∆',
          name: 'Congruencia',
          imgRoute: 'assets/formulas/math/Teos/Congruencia.png',
        ),
        FormulaArguments(
          char: '∆',
          name: 'Semejanza',
          imgRoute: 'assets/formulas/math/Teos/Semejanza.png',
        ),
        FormulaArguments(
          char: '∆',
          name: 'Pitágoras',
          imgRoute: 'assets/formulas/math/Teos/Pitagoras.png',
        ),
        FormulaArguments(
          char: '/',
          name: 'Tales (General)',
          imgRoute: 'assets/formulas/math/Teos/Tales1.png',
        ),
        FormulaArguments(
          char: '/',
          name: 'Tales (Secantes)',
          imgRoute: 'assets/formulas/math/Teos/Tales2.png',
        ),
        FormulaArguments(
          char: '/',
          name: 'Tales (Triángulo)',
          imgRoute: 'assets/formulas/math/Teos/Tales3.png',
        ),
        FormulaArguments(
          char: 'h',
          name: 'Euclides',
          imgRoute: 'assets/formulas/math/Teos/Euclides.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Figuras 2D',
      text: '❒',
      formulas: [
        FormulaArguments(
          char: 'P',
          name: 'Perímetros',
          imgRoute: 'assets/formulas/math/2D/Perimetros.png',
        ),
        FormulaArguments(
          char: 'A',
          name: 'Áreas',
          imgRoute: 'assets/formulas/math/2D/Areas.png',
        ),
        FormulaArguments(
          char: '|',
          name: 'Cuadrilátero',
          imgRoute: 'assets/formulas/math/2D/Cuadrilatero.png',
        ),
        FormulaArguments(
          char: '/',
          name: 'Paralelógramos (General)',
          imgRoute: 'assets/formulas/math/2D/Paralelogramos.png',
        ),
        FormulaArguments(
          char: '❒',
          name: 'Cuadrado',
          imgRoute: 'assets/formulas/math/2D/Cuadrado.png',
        ),
        FormulaArguments(
          char: '❒',
          name: 'Rectángulo',
          imgRoute: 'assets/formulas/math/2D/Rectangulo.png',
        ),
        FormulaArguments(
          char: '⧫',
          name: 'Rombo',
          imgRoute: 'assets/formulas/math/2D/Rombo.png',
        ),
        FormulaArguments(
          char: '⧫',
          name: 'Romboide',
          imgRoute: 'assets/formulas/math/2D/Romboide.png',
        ),
      ],
    ),
  ],
);

int factorial(int n) {
  if (n < 0) throw ('Negative numbers are not allowed.');
  return n <= 1 ? 1 : n * factorial(n - 1);
}
