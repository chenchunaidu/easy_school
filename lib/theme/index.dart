import 'package:flutter/material.dart';
import 'package:easy_school/theme/buttons.dart';
import 'package:easy_school/theme/text.dart';

import 'input.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
      primarySwatch: Colors.grey,
      fontFamily: 'Inter',
      primaryColor: Colors.black,
      textTheme: getTextTheme(),
      textButtonTheme: textButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      inputDecorationTheme: inputDecorationTheme);
}
