import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/units.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

final physics = CourseArguments(
  title: 'Física',
  contents: [
    ContentArguments(
      title: 'Ondas',
      icon: Typicons.waves,
      formulas: [
        FormulaArguments(
          resultUnit: Time(),
          char: 'T',
          name: 'Periódo',
          svgRoute: 'assets/formulas/physics/Periodo.svg',
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
        FormulaArguments(
          resultUnit: Time(),
          char: 'f',
          name: 'Frecuencia',
          svgRoute: 'assets/formulas/physics/Frecuencia.svg',
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
            double inputT = m.values.toList()[0];

            double t = m.keys.toList()[0].getValue(inputT);
            double n = m.values.toList()[1];

            return t / n;
          },
        ),
      ],
    ),
  ],
);
