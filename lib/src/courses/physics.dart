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
          svgRoute: 'assets/formulas/physics/Waves/Periodo.svg',
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
          resultUnit: Frecuency(),
          char: 'f',
          name: 'Frecuencia',
          svgRoute: 'assets/formulas/physics/Waves/Frecuencia.svg',
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
        FormulaArguments(
          char: 'λ',
          svgRoute: 'assets/formulas/physics/Waves/LdeOnda1.svg',
          resultUnit: Length(),
          name: 'Longitud de Onda I',
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
        FormulaArguments(
          char: 'λ',
          svgRoute: 'assets/formulas/physics/Waves/LdeOnda2.svg',
          resultUnit: Length(),
          name: 'Longitud de Onda II',
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
        FormulaArguments(
          char: 'λ',
          svgRoute: 'assets/formulas/physics/Waves/LdeOnda3.svg',
          resultUnit: Length(),
          name: 'Longitud de Onda III',
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
        FormulaArguments(
          char: 'v',
          svgRoute: 'assets/formulas/physics/Waves/VdeProp1.svg',
          resultUnit: VelocityU(),
          name: 'Velocidad de Propagación I',
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
        FormulaArguments(
          char: 'v',
          svgRoute: 'assets/formulas/physics/Waves/VdeProp2.svg',
          resultUnit: VelocityU(),
          name: 'Velocidad de Propagación II',
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
        FormulaArguments(
          char: 'v',
          svgRoute: 'assets/formulas/physics/Waves/VdeProp3.svg',
          resultUnit: VelocityU(),
          name: 'Velocidad de Propagación III',
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
      ],
    ),
  ],
);
