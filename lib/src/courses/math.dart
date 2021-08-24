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
          svgRoute: 'assets/formulas/math/Functions/Porcentaje.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Potencias',
          svgRoute: 'assets/formulas/math/Functions/Porcentaje.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Raíces',
          svgRoute: 'assets/formulas/math/Functions/Porcentaje.svg',
        ),
        FormulaArguments(
          char: '',
          name: 'Logaritmos',
          svgRoute: 'assets/formulas/math/Functions/Porcentaje.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Funciones',
      icon: Ionicons.logo_figma,
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
