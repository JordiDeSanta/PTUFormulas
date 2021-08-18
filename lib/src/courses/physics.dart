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
    ContentArguments(
      title: 'Movimiento Rectilíneo Uniforme',
      icon: Ionicons.arrow_forward,
      formulas: [
        FormulaArguments(
          resultUnit: Length(),
          char: 'd',
          name: 'Desplazamiento',
          svgRoute: 'assets/formulas/physics/MRU/Desplazamiento.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Rapidez',
          svgRoute: 'assets/formulas/physics/MRU/Rapidez.svg',
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
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad',
          svgRoute: 'assets/formulas/physics/MRU/Velocidad.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'x',
          name: 'Posición',
          svgRoute: 'assets/formulas/physics/MRU/Posicion.svg',
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
        FormulaArguments(
          resultUnit: Time(),
          char: 't',
          name: 'Tiempo Transcurrido',
          svgRoute: 'assets/formulas/physics/MRU/Tiempo.svg',
          params: {
            Param(name: 'Distancia Recorrida', med: Length()): 1.0,
            Param(name: 'Velocidad', med: VelocityU()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputD = m.values.toList()[0];
            double inputV = m.values.toList()[1];

            double d = m.keys.toList()[0].getValue(inputD);
            double v = m.keys.toList()[1].getValue(inputV);

            return d / v;
          },
        ),
        FormulaArguments(
          resultUnit: Time(),
          char: 't\u2091',
          name: 'Tiempo de Encuentro',
          svgRoute: 'assets/formulas/physics/MRU/TdeEncuentro.svg',
          params: {
            Param(name: 'Distancia', med: Length()): 1.0,
            Param(name: 'V. Móvil A', med: VelocityU()): 1.0,
            Param(name: 'V. Móvil B', med: VelocityU()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputD = m.values.toList()[0];
            double inputVA = m.values.toList()[1];
            double inputVB = m.values.toList()[1];

            double d = m.keys.toList()[0].getValue(inputD);
            double va = m.keys.toList()[1].getValue(inputVA);
            double vb = m.keys.toList()[2].getValue(inputVB);

            return d / (va + vb);
          },
        ),
        FormulaArguments(
          resultUnit: Time(),
          char: 't\u2090',
          name: 'Tiempo de Alcance',
          svgRoute: 'assets/formulas/physics/MRU/TdeAlcance.svg',
          params: {
            Param(name: 'Distancia', med: Length()): 1.0,
            Param(name: 'V. Móvil A', med: VelocityU()): 1.0,
            Param(name: 'V. Móvil B', med: VelocityU()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputD = m.values.toList()[0];
            double inputVA = m.values.toList()[1];
            double inputVB = m.values.toList()[1];

            double d = m.keys.toList()[0].getValue(inputD);
            double va = m.keys.toList()[1].getValue(inputVA);
            double vb = m.keys.toList()[2].getValue(inputVB);

            return d / (va - vb);
          },
        ),
      ],
    ),
  ],
);
