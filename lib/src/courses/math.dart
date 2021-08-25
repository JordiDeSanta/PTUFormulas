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
      title: 'Funciones',
      text: 'f(x)',
      formulas: [
        FormulaArguments(
          char: 'f',
          name: 'Función Afín',
          svgRoute: 'assets/formulas/math/Functions/FuncionAfin.svg',
        ),
      ],
    ),
  ],
);
