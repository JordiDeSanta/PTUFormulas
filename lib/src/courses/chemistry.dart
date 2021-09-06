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
          char: '|a|',
          name: 'Muy importante',
          imgRoute: 'assets/formulas/math/Numbers/Importante.png',
        ),
      ],
    ),
  ],
);
