import 'dart:math';

import 'package:ezformulas/src/providers/_provider.dart';
import 'package:ezformulas/src/providers/units.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

final chemistry = CourseArguments(
  title: 'Química',
  contents: [
    ContentArguments(
      title: 'Átomo',
      icon: FontAwesomeIcons.atom,
      formulas: [
        FormulaArguments(
          char: '+',
          name: 'Catión',
          imgRoute: 'assets/formulas/chemistry/Atom/Cation.png',
        ),
        FormulaArguments(
          char: '-',
          name: 'Anión',
          imgRoute: 'assets/formulas/chemistry/Atom/Anion.png',
        ),
        FormulaArguments(
          char: 'Z',
          name: 'Isótopos',
          imgRoute: 'assets/formulas/chemistry/Atom/Isotopos.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Isótonos',
          imgRoute: 'assets/formulas/chemistry/Atom/Isotonos.png',
        ),
        FormulaArguments(
          char: 'A',
          name: 'Isóbaros',
          imgRoute: 'assets/formulas/chemistry/Atom/Isobaros.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Hidrocarburos',
      icon: FontAwesomeIcons.smog,
      formulas: [
        FormulaArguments(
          char: 'n',
          name: 'Nota',
          imgRoute: 'assets/formulas/chemistry/Hidrocarburos/Nota.png',
        ),
        FormulaArguments(
          char: 'C',
          name: 'Cantidad de Carbonos (prefijo)',
          imgRoute: 'assets/formulas/chemistry/Hidrocarburos/Prefijos.png',
        ),
        FormulaArguments(
          char: 'e',
          name: 'Cantidad de Insaturaciones (medio)',
          imgRoute: 'assets/formulas/chemistry/Hidrocarburos/Enlaces.png',
        ),
        FormulaArguments(
          char: '=',
          name: 'Tipo de HC (sufijo)',
          imgRoute: 'assets/formulas/chemistry/Hidrocarburos/Sufijos.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Grupos Funcionales',
      icon: Ionicons.cube_outline,
      formulas: [
        FormulaArguments(
          char: 'O',
          name: 'Ácido Carboxílico',
          imgRoute: 'assets/formulas/chemistry/Grupos/AcidoCarbo.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Anhídrido de Ácido',
          imgRoute: 'assets/formulas/chemistry/Grupos/Anhidrido.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Éster',
          imgRoute: 'assets/formulas/chemistry/Grupos/Ester.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Amida',
          imgRoute: 'assets/formulas/chemistry/Grupos/Amida.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Nitrilo',
          imgRoute: 'assets/formulas/chemistry/Grupos/Nitrilo.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Aldehído',
          imgRoute: 'assets/formulas/chemistry/Grupos/Aldehido.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Cetona',
          imgRoute: 'assets/formulas/chemistry/Grupos/Cetona.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Alcohol',
          imgRoute: 'assets/formulas/chemistry/Grupos/Alcohol.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Fenol',
          imgRoute: 'assets/formulas/chemistry/Grupos/Fenol.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Amina',
          imgRoute: 'assets/formulas/chemistry/Grupos/Amina.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Éter',
          imgRoute: 'assets/formulas/chemistry/Grupos/Eter.png',
        ),
        FormulaArguments(
          char: 'S',
          name: 'Sulfuro',
          imgRoute: 'assets/formulas/chemistry/Grupos/Sulfuro.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Sustituyentes',
      text: 'S',
      formulas: [
        FormulaArguments(
          char: 'O',
          name: 'Éster',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Ester.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Amida',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Amida.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Nitrilo',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Nitrilo.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Aldehído',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Aldehido.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Cetona',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Cetona.png',
        ),
        FormulaArguments(
          char: 'O',
          name: 'Alcohol',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Alcohol.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Amina',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Amina.png',
        ),
        FormulaArguments(
          char: 'S',
          name: 'Sulfuro',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Sulfuros.png',
        ),
        FormulaArguments(
          char: 'X',
          name: 'Halogenuro',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Halogenuro.png',
        ),
        FormulaArguments(
          char: 'N',
          name: 'Nitrocompuesto',
          imgRoute: 'assets/formulas/chemistry/Sustituyentes/Nitro.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Inorgánica',
      icon: Ionicons.color_palette_outline,
      formulas: [
        FormulaArguments(
          char: 'OM',
          name: 'Óxido Metálico',
          imgRoute: 'assets/formulas/chemistry/Inorganica/OxidoM.png',
        ),
        FormulaArguments(
          char: 'ON',
          name: 'Óxido No Metálico',
          imgRoute: 'assets/formulas/chemistry/Inorganica/OxidoNM.png',
        ),
        FormulaArguments(
          char: 'HM',
          name: 'Hidruro Metálico',
          imgRoute: 'assets/formulas/chemistry/Inorganica/HidruroM.png',
        ),
        FormulaArguments(
          char: 'HN',
          name: 'Hidruro No Metálico',
          imgRoute: 'assets/formulas/chemistry/Inorganica/HidruroNM.png',
        ),
        FormulaArguments(
          char: 'HN',
          name: 'Ácido',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Acido.png',
        ),
        FormulaArguments(
          char: 'HNO',
          name: 'Oxácido',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Oxacido.png',
        ),
        FormulaArguments(
          char: 'XO',
          name: 'Peróxido',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Oxacido.png',
        ),
        FormulaArguments(
          char: 'MN',
          name: 'Sal Binaria',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Sal.png',
        ),
        FormulaArguments(
          char: 'MO',
          name: 'Hidróxido',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Hidroxido.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Mol',
      text: 'n',
      formulas: [
        FormulaArguments(
          char: 'A',
          name: 'N° de Avogrado',
          svgRoute: 'assets/formulas/chemistry/Mol/Avogadro.svg',
        ),
        FormulaArguments(
          char: 'n',
          name: 'N° de Moles I',
          svgRoute: 'assets/formulas/chemistry/Mol/Moles.svg',
          params: <Param, double>{
            Param(name: 'N° de Moléculas'): 0.0,
          },
          formula: (Map<Param, double> m) {
            double n = m.values.toList()[0];

            return n / 6.022e23;
          },
        ),
        FormulaArguments(
          char: 'n',
          name: 'N° de Moles II',
          svgRoute: 'assets/formulas/chemistry/Mol/Moles2.svg',
          params: <Param, double>{
            Param(name: 'Masa (g)'): 0.0,
            Param(name: 'Masa Molecular (g)'): 0.0,
          },
          formula: (Map<Param, double> m) {
            double ma = m.values.toList()[0];
            double mm = m.values.toList()[1];

            return ma / mm;
          },
        ),
      ],
    ),
    ContentArguments(
      title: 'Gases',
      icon: FontAwesomeIcons.gasPump,
      formulas: [
        FormulaArguments(
          char: 'B',
          name: 'Ley de Boyle',
          svgRoute: 'assets/formulas/chemistry/Gases/Boyle.svg',
        ),
        FormulaArguments(
          char: 'G',
          name: 'Ley de Gay-Lussac I',
          svgRoute: 'assets/formulas/chemistry/Gases/GayLussac1.svg',
        ),
        FormulaArguments(
          char: 'G',
          name: 'Ley de Gay-Lussac II',
          svgRoute: 'assets/formulas/chemistry/Gases/GayLussac2.svg',
        ),
        FormulaArguments(
          char: 'C',
          name: 'Leyes Combinadas',
          svgRoute: 'assets/formulas/chemistry/Gases/Combinada.svg',
        ),
        FormulaArguments(
          char: 'I',
          name: 'Ley de Gases Ideales',
          svgRoute: 'assets/formulas/chemistry/Gases/Ideales.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Concentraciones Físicas',
      icon: Ionicons.color_fill_outline,
      formulas: [
        FormulaArguments(
          resultUnit: Density(),
          char: 'd',
          name: 'Densidad',
          svgRoute: 'assets/formulas/chemistry/Fisicas/Densidad.svg',
          params: <Param, double>{
            Param(name: 'Masa', med: Mass()): 0.0,
            Param(name: 'Volumen', med: Volumen()): 0.0,
          },
          formula: (Map<Param, double> m) {
            double ma = m.values.toList()[0];
            double mm = m.values.toList()[1];

            return ma / mm;
          },
        ),
        FormulaArguments(
          char: '%',
          name: '%masa-masa',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pmm.svg',
          params: {
            Param(name: 'gramos de sto'): 1.0,
            Param(name: 'gramos de sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double msto = m.values.toList()[0];
            double msln = m.values.toList()[1];

            return (msto / msln) * 100;
          },
        ),
        FormulaArguments(
          char: '%',
          name: '%masa-volumen',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pmv.svg',
          params: {
            Param(name: 'gramos de sto'): 1.0,
            Param(name: 'ml de sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double msto = m.values.toList()[0];
            double vsln = m.values.toList()[1];

            return (msto / vsln) * 100;
          },
        ),
        FormulaArguments(
          char: '%',
          name: '%volumen-volumen',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pvv.svg',
          params: {
            Param(name: 'ml de sto'): 1.0,
            Param(name: 'ml de sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double vsto = m.values.toList()[0];
            double vsln = m.values.toList()[1];

            return (vsto / vsln) * 100;
          },
        ),
        FormulaArguments(
          char: 'p',
          name: 'Partes por Millón',
          svgRoute: 'assets/formulas/chemistry/Fisicas/ppm.svg',
          params: {
            Param(name: 'mg de sto'): 1.0,
            Param(name: 'kg de sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double msto = m.values.toList()[0];
            double vsln = m.values.toList()[1];

            return msto / vsln;
          },
        ),
      ],
    ),
    ContentArguments(
      title: 'Concentraciones Químicas',
      icon: Ionicons.wine_outline,
      formulas: [
        FormulaArguments(
          char: 'M',
          name: 'Molaridad',
          svgRoute: 'assets/formulas/chemistry/Quimicas/Molaridad.svg',
          params: {
            Param(name: 'Moles de sto'): 1.0,
            Param(name: 'L de sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double nsto = m.values.toList()[0];
            double lsln = m.values.toList()[1];

            return nsto / lsln;
          },
        ),
        FormulaArguments(
          char: 'm',
          name: 'Molalidad',
          svgRoute: 'assets/formulas/chemistry/Quimicas/Molalidad.svg',
          params: {
            Param(name: 'Moles de sto'): 1.0,
            Param(name: 'Kg de ste'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double nsto = m.values.toList()[0];
            double kgste = m.values.toList()[1];

            return nsto / kgste;
          },
        ),
        FormulaArguments(
          char: 'n',
          name: 'Moles de Soluto',
          svgRoute: 'assets/formulas/chemistry/Quimicas/MolesSto.svg',
          params: {
            Param(name: 'Molaridad'): 1.0,
            Param(name: 'Volumen Sln (L)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double ml = m.values.toList()[0];
            double v = m.values.toList()[1];

            return ml * v;
          },
        ),
        FormulaArguments(
          char: 'X',
          name: 'Fracción Molar',
          svgRoute: 'assets/formulas/chemistry/Quimicas/FraccionMolars.svg',
          params: {
            Param(name: 'Moles del Componente'): 1.0,
            Param(name: 'Moles de Sln'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double mc = m.values.toList()[0];
            double mt = m.values.toList()[1];

            return mc / mt;
          },
        ),
        FormulaArguments(
          char: 'd',
          name: 'Dilución',
          svgRoute: 'assets/formulas/chemistry/Quimicas/Dilucion.svg',
        ),
        FormulaArguments(
          char: 'M',
          name: 'Molaridad de Mezcla',
          svgRoute: 'assets/formulas/chemistry/Quimicas/Mezcla.svg',
          params: {
            Param(name: 'Masa Inicial (g)'): 1.0,
            Param(name: 'Masa Final (g)'): 1.0,
            Param(name: 'Volumen Inicial (L)'): 1.0,
            Param(name: 'Volumen Final (L)'): 1.0,
          },
          formula: (Map<Param, double> m) {
            double mi = m.values.toList()[0];
            double mf = m.values.toList()[1];
            double vi = m.values.toList()[2];
            double vf = m.values.toList()[3];

            return ((mi * vi) + (mf * vf)) / (vi + vf);
          },
        ),
      ],
    ),
  ],
);
