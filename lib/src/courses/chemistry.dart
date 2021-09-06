import 'dart:math';

import 'package:ezformulas/src/providers/_provider.dart';
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
        ),
        FormulaArguments(
          char: 'n',
          name: 'N° de Moles II',
          svgRoute: 'assets/formulas/chemistry/Mol/Moles2.svg',
        ),
      ],
    ),
    ContentArguments(
      title: 'Gases',
      icon: FontAwesomeIcons.gasPump,
      formulas: [
        FormulaArguments(
          char: 'MO',
          name: 'Hidróxido',
          imgRoute: 'assets/formulas/chemistry/Inorganica/Hidroxido.png',
        ),
      ],
    ),
    ContentArguments(
      title: 'Concentraciones Físicas',
      icon: Ionicons.color_fill_outline,
      formulas: [
        FormulaArguments(
          char: 'd',
          name: 'Densidad',
          svgRoute: 'assets/formulas/chemistry/Fisicas/Densidad.svg',
        ),
        FormulaArguments(
          char: '%',
          name: '%masa-masa',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pmm.svg',
        ),
        FormulaArguments(
          char: '%',
          name: '%masa-volumen',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pmv.svg',
        ),
        FormulaArguments(
          char: '%',
          name: '%volumen-volumen',
          svgRoute: 'assets/formulas/chemistry/Fisicas/pvv.svg',
        ),
        FormulaArguments(
          char: 'p',
          name: 'Partes por Millón',
          svgRoute: 'assets/formulas/chemistry/Fisicas/ppm.svg',
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
        ),
        FormulaArguments(
          char: 'm',
          name: 'Molalidad',
          svgRoute: 'assets/formulas/chemistry/Quimicas/Molalidad.svg',
        ),
        FormulaArguments(
          char: 'n',
          name: 'Moles de Soluto',
          svgRoute: 'assets/formulas/chemistry/Quimicas/MolesSto.svg',
        ),
        FormulaArguments(
          char: 'X',
          name: 'Fracción Molar',
          svgRoute: 'assets/formulas/chemistry/Quimicas/FraccionMolars.svg',
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
        ),
      ],
    ),
  ],
);
