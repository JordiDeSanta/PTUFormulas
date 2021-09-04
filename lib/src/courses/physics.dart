import 'dart:math';

import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/units.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
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
            double inputVB = m.values.toList()[2];

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
            double inputVB = m.values.toList()[2];

            double d = m.keys.toList()[0].getValue(inputD);
            double va = m.keys.toList()[1].getValue(inputVA);
            double vb = m.keys.toList()[2].getValue(inputVB);

            return d / (va - vb).abs();
          },
        ),
      ],
    ),
    ContentArguments(
      title: 'Movimiento Rectilineo Variado',
      icon: FontAwesomeIcons.car,
      formulas: [
        FormulaArguments(
          resultUnit: Aceleration(),
          char: 'a',
          name: 'Aceleración',
          svgRoute: 'assets/formulas/physics/MRUV/Aceleracion.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Instantánea',
          svgRoute: 'assets/formulas/physics/MRUV/Velocidad1.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Final',
          svgRoute: 'assets/formulas/physics/MRUV/Velocidad2.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'x',
          name: 'Posición I',
          svgRoute: 'assets/formulas/physics/MRUV/Posicion1.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'x',
          name: 'Posición II',
          svgRoute: 'assets/formulas/physics/MRUV/Posicion2.svg',
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
    ),
    ContentArguments(
      title: 'Caída Libre',
      icon: FontAwesomeIcons.footballBall,
      formulas: [
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Instantánea',
          svgRoute: 'assets/formulas/physics/CL/VelocidadInstantanea.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Final',
          svgRoute: 'assets/formulas/physics/CL/VelocidadFinal.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'h',
          name: 'Altura I',
          svgRoute: 'assets/formulas/physics/CL/Altura.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'h',
          name: 'Altura II',
          imgRoute: 'assets/formulas/physics/CL/Altura2.png',
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
        FormulaArguments(
          resultUnit: Time(),
          char: 't',
          name: 'Tiempo de Caída',
          svgRoute: 'assets/formulas/physics/CL/Tiempo.svg',
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
    ),
    ContentArguments(
      title: 'Tiro Vertical',
      icon: FontAwesomeIcons.arrowUp,
      formulas: [
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Instantánea',
          svgRoute: 'assets/formulas/physics/TV/VelocidadInstantanea.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Final',
          svgRoute: 'assets/formulas/physics/TV/VelocidadFinal.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'h',
          name: 'Altura I',
          svgRoute: 'assets/formulas/physics/TV/Altura.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'h',
          name: 'Altura II',
          svgRoute: 'assets/formulas/physics/TV/Altura2.svg',
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
        FormulaArguments(
          resultUnit: VelocityU(),
          char: 'v',
          name: 'Velocidad Inicial',
          imgRoute: 'assets/formulas/physics/TV/VelocidadInicial.png',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 'h',
          name: 'Altura Máxima',
          svgRoute: 'assets/formulas/physics/TV/AlturaMaxima.svg',
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
        FormulaArguments(
          resultUnit: Length(),
          char: 't',
          name: 'Tiempo de Subida',
          svgRoute: 'assets/formulas/physics/TV/Tiempo.svg',
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
    ),
    ContentArguments(
      title: 'Fuerzas',
      icon: FontAwesomeIcons.dumbbell,
      formulas: [
        FormulaArguments(
          resultUnit: Force(),
          char: 'F',
          name: 'Fuerza',
          svgRoute: 'assets/formulas/physics/Forces/Fuerza.svg',
          params: {
            Param(name: 'Masa', med: Mass()): 0,
            Param(name: 'Aceleración', med: Aceleration()): 0,
          },
          formula: (Map<Param, double> m) {
            double inputM = m.values.toList()[0];
            double inputA = m.values.toList()[1];

            double ma = m.keys.toList()[0].getValue(inputM);
            double a = m.keys.toList()[1].getValue(inputA);

            return ma * a;
          },
        ),
        FormulaArguments(
          resultUnit: Force(),
          char: 'P',
          name: 'Peso y Normal',
          svgRoute: 'assets/formulas/physics/Forces/Peso.svg',
          params: {
            Param(name: 'Masa', med: Mass()): 0,
            Param(name: 'Gravedad', med: Aceleration()): 0,
          },
          formula: (Map<Param, double> m) {
            double inputM = m.values.toList()[0];
            double inputA = m.values.toList()[1];

            double ma = m.keys.toList()[0].getValue(inputM);
            double a = m.keys.toList()[1].getValue(inputA);

            return ma * a;
          },
        ),
        FormulaArguments(
          resultUnit: Force(),
          char: 'e',
          name: 'Fricción Estática',
          svgRoute: 'assets/formulas/physics/Forces/Estatica.svg',
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
        FormulaArguments(
          resultUnit: Force(),
          char: 'c',
          name: 'Fricción Cinética',
          svgRoute: 'assets/formulas/physics/Forces/Cinetica.svg',
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
        FormulaArguments(
          resultUnit: Force(),
          char: 'E',
          name: 'Fuerza Elástica',
          svgRoute: 'assets/formulas/physics/Forces/Elastica.svg',
          params: {
            Param(name: 'Longitud de la Deformación', med: Length()): 1.0,
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
    ),
    ContentArguments(
      title: 'Choques',
      icon: FontAwesomeIcons.carCrash,
      formulas: [
        FormulaArguments(
          resultUnit: Force(),
          char: 'p',
          name: 'Momentum',
          svgRoute: 'assets/formulas/physics/Colls/Momentum.svg',
          params: {
            Param(name: 'Masa', med: Mass()): 1.0,
            Param(name: 'Velocidad', med: VelocityU()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputM = m.values.toList()[0];
            double inputV = m.values.toList()[1];

            double ma = m.keys.toList()[0].getValue(inputM);
            double v = m.keys.toList()[1].getValue(inputV);

            return ma * v;
          },
        ),
        FormulaArguments(
          char: 'p',
          name: 'Conservación del Momentum',
          svgRoute: 'assets/formulas/physics/Colls/Conservacion.svg',
        ),
        FormulaArguments(
          char: 'I',
          name: 'Impulso',
          svgRoute: 'assets/formulas/physics/Colls/Impulso.svg',
          params: {
            Param(name: 'Fuerza', med: Force()): 1.0,
            Param(name: 'Tiempo Transcurrido', med: Time()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputF = m.values.toList()[0];
            double inputT = m.values.toList()[1];

            double f = m.keys.toList()[0].getValue(inputF);
            double t = m.keys.toList()[1].getValue(inputT);

            return f * t;
          },
        ),
        FormulaArguments(
          resultUnit: Force(),
          char: 'e',
          name: 'Choque Elástico',
          svgRoute: 'assets/formulas/physics/Colls/Elastico.svg',
        ),
        FormulaArguments(
          resultUnit: Force(),
          char: 'i',
          name: 'Choque Inelástico',
          svgRoute: 'assets/formulas/physics/Colls/Inelastico.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Cosmos',
      icon: FontAwesomeIcons.globeAmericas,
      formulas: [
        FormulaArguments(
          resultUnit: Force(),
          char: 'G',
          name: 'Gravitación Universal',
          svgRoute: 'assets/formulas/physics/Cosmos/Gravitacion.svg',
          params: {
            Param(name: 'Masa del cuerpo 1', med: Mass()): 1.0,
            Param(name: 'Masa del cuerpo 2', med: Mass()): 1.0,
            Param(
              name: 'Distancia entre sus centros',
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
        FormulaArguments(
          char: 'K',
          name: 'Constante Orbital',
          svgRoute: 'assets/formulas/physics/Cosmos/Kepler.svg',
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
    ),
    ContentArguments(
      title: 'Hidrostática y Presión',
      icon: FontAwesomeIcons.water,
      formulas: [
        FormulaArguments(
          resultUnit: Pressure(),
          char: 'P',
          name: 'Presión',
          svgRoute: 'assets/formulas/physics/Hidro/Presion.svg',
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
        FormulaArguments(
          resultUnit: Density(),
          char: '𝜌',
          name: 'Densidad',
          svgRoute: 'assets/formulas/physics/Hidro/Densidad.svg',
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
        FormulaArguments(
          resultUnit: Pressure(),
          char: 'h',
          name: 'Presión Hidrostática',
          svgRoute: 'assets/formulas/physics/Hidro/Hidrostatica.svg',
          params: {
            Param(name: 'Densidad del líquido', med: Density()): 1.0,
            Param(name: 'Gravedad', med: Aceleration()): 1.0,
            Param(name: 'Profundidad', med: Length()): 1.0,
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
        FormulaArguments(
          resultUnit: Pressure(),
          char: 'a',
          name: 'Presión Absoluta',
          svgRoute: 'assets/formulas/physics/Hidro/Absoluta.svg',
          params: {
            Param(name: 'Presión Hidrostática', med: Pressure()): 1.0,
            Param(name: 'Presión Atmosférica', med: Pressure()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputph = m.values.toList()[0];
            double inputpa = m.values.toList()[1];

            double ph = m.keys.toList()[0].getValue(inputph);
            double pa = m.keys.toList()[1].getValue(inputpa);

            return ph + pa;
          },
        ),
        FormulaArguments(
          resultUnit: Pressure(),
          char: 'P',
          name: 'Principio de Pascal',
          svgRoute: 'assets/formulas/physics/Hidro/Pascal.svg',
        ),
        FormulaArguments(
          resultUnit: Force(),
          char: 'E',
          name: 'Flotación (Arquímedes)',
          svgRoute: 'assets/formulas/physics/Hidro/Flotacion.svg',
          params: {
            Param(name: 'Densidad del líquido', med: Density()): 1.0,
            Param(name: 'Volumen', med: Volumen()): 1.0,
            Param(name: 'Gravedad', med: Aceleration()): 1.0,
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
    ),
    ContentArguments(
      title: 'Energía, Trabajo y Potencia',
      icon: FontAwesomeIcons.solarPanel,
      formulas: [
        FormulaArguments(
          resultUnit: Energy(),
          char: 'K',
          name: 'Energía Cinética',
          svgRoute: 'assets/formulas/physics/Energy/Cinetica.svg',
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
        FormulaArguments(
          resultUnit: Energy(),
          char: 'G',
          name: 'Energía Potencial Gravitatoria',
          svgRoute: 'assets/formulas/physics/Energy/PotencialG.svg',
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
        FormulaArguments(
          resultUnit: Energy(),
          char: 'E',
          name: 'Energía Potencial Elástica',
          svgRoute: 'assets/formulas/physics/Energy/PotencialE.svg',
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
        FormulaArguments(
          resultUnit: Energy(),
          char: 'M',
          name: 'Energía Mecánica',
          svgRoute: 'assets/formulas/physics/Energy/Mecanica.svg',
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
        FormulaArguments(
          char: 'M',
          name: 'Conservación de la Energía',
          svgRoute: 'assets/formulas/physics/Energy/Conservacion.svg',
        ),
        FormulaArguments(
          char: 'M',
          name: 'Variación de la Energía',
          svgRoute: 'assets/formulas/physics/Energy/Variacion.svg',
        ),
        FormulaArguments(
          char: 'W',
          name: 'Fuerza Disipativa',
          svgRoute: 'assets/formulas/physics/Energy/Disipativa.svg',
        ),
        FormulaArguments(
          resultUnit: Energy(),
          char: 'W',
          name: 'Trabajo',
          svgRoute: 'assets/formulas/physics/Energy/Trabajo.svg',
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
        FormulaArguments(
          resultUnit: Power(),
          char: 'P',
          name: 'Potencia I',
          svgRoute: 'assets/formulas/physics/Energy/Potencia.svg',
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
        FormulaArguments(
          resultUnit: Power(),
          char: 'P',
          name: 'Potencia II',
          svgRoute: 'assets/formulas/physics/Energy/Potencia2.svg',
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
    ),
    ContentArguments(
      title: 'Termodinámica',
      icon: FontAwesomeIcons.fire,
      formulas: [
        FormulaArguments(
          char: 'Q',
          svgRoute: 'assets/formulas/physics/Termo/Calor.svg',
          name: 'Cantidad de Calor I (cal)',
          params: {
            Param(name: 'Masa del Cuerpo (g)'): 1.0,
            Param(name: 'Calor Especifico del Material'): 1.0,
            Param(name: 'Temperatura Final (°C)'): 1.0,
            Param(name: 'Temperatura Inicial (°C)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double ma = m.values.toList()[0];
            double ce = m.values.toList()[1];
            double tf = m.values.toList()[2];
            double t0 = m.values.toList()[3];

            return ma * ce * (tf - t0);
          },
        ),
        FormulaArguments(
          char: 'Q',
          svgRoute: 'assets/formulas/physics/Termo/Calor2.svg',
          name: 'Cantidad de Calor II (J)',
          params: {
            Param(name: 'Masa del Cuerpo (Kg))'): 1.0,
            Param(name: 'Calor Latente (J/Kg)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double ma = m.values.toList()[0];
            double l = m.values.toList()[1];

            return l * ma;
          },
        ),
        FormulaArguments(
          char: 'c',
          svgRoute: 'assets/formulas/physics/Termo/CalorE.svg',
          name: 'Calor Específico (cal/g°C)',
          params: {
            Param(name: 'Capacidad Térmica'): 1.0,
            Param(name: 'Masa (g)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double c = m.values.toList()[0];
            double ma = m.values.toList()[1];

            return c / ma;
          },
        ),
        FormulaArguments(
          char: 'C',
          svgRoute: 'assets/formulas/physics/Termo/CapacidadT.svg',
          name: 'Capacidad Térmica (cal/°C)',
          params: {
            Param(name: 'Calor Final (cal)'): 1.0,
            Param(name: 'Calor Inicial (cal)'): 1.0,
            Param(name: 'Temperatura Final (°C)'): 1.0,
            Param(name: 'Temperatura Inicial (°C)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double qf = m.values.toList()[0];
            double q0 = m.values.toList()[1];
            double tf = m.values.toList()[2];
            double t0 = m.values.toList()[3];

            return (qf - q0) / (tf - t0);
          },
        ),
        FormulaArguments(
          resultUnit: Length(),
          char: 'α',
          svgRoute: 'assets/formulas/physics/Termo/Lineal.svg',
          name: 'Dilatación Lineal',
          params: {
            Param(name: 'Longitud Inicial', med: Length()): 1.0,
            Param(name: 'Coeficiente de Dilatación Lineal'): 1.0,
            Param(name: 'Temperatura Final (°C)'): 1.0,
            Param(name: 'Temperatura Inicial (°C)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputLO = m.values.toList()[0];
            double a = m.values.toList()[1];
            double tf = m.values.toList()[2];
            double t0 = m.values.toList()[3];

            double lo = m.keys.toList()[0].getValue(inputLO);

            return lo * a * (tf - t0);
          },
        ),
        FormulaArguments(
          resultUnit: Area(),
          char: 'β',
          svgRoute: 'assets/formulas/physics/Termo/Superficial.svg',
          name: 'Dilatación Superficial',
          params: {
            Param(name: 'Área Inicial', med: Area()): 1.0,
            Param(name: 'Coeficiente de Dilatación Superficial'): 1.0,
            Param(name: 'Temperatura Final (°C)'): 1.0,
            Param(name: 'Temperatura Inicial (°C)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputSO = m.values.toList()[0];
            double b = m.values.toList()[1];
            double tf = m.values.toList()[2];
            double t0 = m.values.toList()[3];

            double so = m.keys.toList()[0].getValue(inputSO);

            return so * b * (tf - t0);
          },
        ),
        FormulaArguments(
          resultUnit: Volumen(),
          char: 'γ',
          svgRoute: 'assets/formulas/physics/Termo/Volumetrica.svg',
          name: 'Dilatación Volumétrica',
          params: {
            Param(name: 'Volumen Inicial', med: Volumen()): 1.0,
            Param(name: 'Coeficiente de Dilatación Volumétrica'): 1.0,
            Param(name: 'Temperatura Final (°C)'): 1.0,
            Param(name: 'Temperatura Inicial (°C)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputV0 = m.values.toList()[0];
            double g = m.values.toList()[1];
            double tf = m.values.toList()[2];
            double t0 = m.values.toList()[3];

            double vo = m.keys.toList()[0].getValue(inputV0);

            return vo * g * (tf - t0);
          },
        ),
        FormulaArguments(
          char: 'L',
          svgRoute: 'assets/formulas/physics/Termo/Latente.svg',
          name: 'Calor Latente',
          params: {
            Param(name: 'Calor (J)'): 1.0,
            Param(name: 'Masa (Kg)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double q = m.values.toList()[0];
            double ma = m.values.toList()[1];

            return q / ma;
          },
        ),
        FormulaArguments(
          char: 'E',
          svgRoute: 'assets/formulas/physics/Termo/Equilibrio.svg',
          name: 'Equilibrio Térmico',
        ),
      ],
    ),
    ContentArguments(
      title: 'Magnetismo',
      icon: FontAwesomeIcons.magnet,
      formulas: [
        FormulaArguments(
          resultUnit: Force(),
          char: 'F',
          name: 'Fuerza de Lorentz',
          svgRoute: 'assets/formulas/physics/Magnetism/Lorentz.svg',
          params: {
            Param(name: 'Carga (Partícula)', med: Charge()): 1.0,
            Param(name: 'Velocidad (Partícula)', med: VelocityU()): 1.0,
            Param(name: 'Campo Magnético', med: MagnetCamp()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputQ = m.values.toList()[0];
            double inputV = m.values.toList()[1];
            double inputB = m.values.toList()[2];

            double q = m.keys.toList()[0].getValue(inputQ);
            double v = m.keys.toList()[1].getValue(inputV);
            double b = m.keys.toList()[2].getValue(inputB);

            return q * v * b;
          },
        ),
        FormulaArguments(
          resultUnit: Length(),
          char: 'R',
          name: 'Radio del Movimiento (Espira)',
          svgRoute: 'assets/formulas/physics/Magnetism/Radio.svg',
          params: {
            Param(name: 'Masa (Partícula)', med: Mass()): 1.0,
            Param(name: 'Velocidad (Partícula)', med: VelocityU()): 1.0,
            Param(name: 'Carga (Partícula)', med: Charge()): 1.0,
            Param(name: 'Campo Magnético', med: MagnetCamp()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputM = m.values.toList()[0];
            double inputV = m.values.toList()[1];
            double inputQ = m.values.toList()[2];
            double inputB = m.values.toList()[3];

            double ma = m.keys.toList()[0].getValue(inputM);
            double v = m.keys.toList()[1].getValue(inputV);
            double q = m.keys.toList()[2].getValue(inputQ);
            double b = m.keys.toList()[3].getValue(inputB);

            return (ma * v) / (q * b);
          },
        ),
        FormulaArguments(
          resultUnit: MagnetCamp(),
          char: 'B',
          name: 'Campo Magnético',
          svgRoute: 'assets/formulas/physics/Magnetism/Campo.svg',
          params: {
            Param(name: 'Intensidad', med: EIntensity()): 1.0,
            Param(name: 'Distancia', med: Length()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputI = m.values.toList()[0];
            double inputA = m.values.toList()[1];

            double u = 4 * pi * 1e-7;
            double i = m.keys.toList()[0].getValue(inputI);
            double a = m.keys.toList()[1].getValue(inputA);

            return (u * i) / (2 * pi * a);
          },
        ),
        FormulaArguments(
          resultUnit: MagnetCamp(),
          char: 'B',
          name: 'Campo Magnético (Espira)',
          svgRoute: 'assets/formulas/physics/Magnetism/Campo2.svg',
          params: {
            Param(name: 'Intensidad', med: EIntensity()): 1.0,
            Param(name: 'Radio', med: Length()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputI = m.values.toList()[0];
            double inputR = m.values.toList()[1];

            double u = 4 * pi * 1e-7;
            double i = m.keys.toList()[0].getValue(inputI);
            double r = m.keys.toList()[1].getValue(inputR);

            return u * (i / (2 * r));
          },
        ),
        FormulaArguments(
          resultUnit: Flux(),
          char: 'ϕ',
          name: 'Flujo Magnético (Espira)',
          svgRoute: 'assets/formulas/physics/Magnetism/Flujo.svg',
          params: {
            Param(name: 'Campo Magnético', med: MagnetCamp()): 1.0,
            Param(name: 'Área de la Espira', med: Area()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double inputB = m.values.toList()[0];
            double inputA = m.values.toList()[1];

            double b = m.keys.toList()[0].getValue(inputB);
            double a = m.keys.toList()[1].getValue(inputA);

            return b * a;
          },
        ),
        FormulaArguments(
          resultUnit: Flux(),
          char: 'ε',
          name: 'Fuerza Electromotriz (Bobina)',
          svgRoute: 'assets/formulas/physics/Magnetism/Fem.svg',
          params: {
            Param(name: 'Número de Espiras'): 1.0,
            Param(name: 'Variación Flujo Magnético', med: Flux()): 1.0,
            Param(name: 'Variación Tiempo', med: Time()): 1.0,
          },
          formula: (Map<Param, double> m) {
            double n = m.values.toList()[0];
            double inputF = m.values.toList()[1];
            double inputT = m.values.toList()[2];

            double f = m.keys.toList()[1].getValue(inputF);
            double t = m.keys.toList()[2].getValue(inputT);

            return -n * (f / t);
          },
        ),
      ],
    ),
  ],
);
