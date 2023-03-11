import 'package:flutter/material.dart';

TextTheme getTextTheme() {
  return TextTheme(
    labelLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)
        .apply(color: Colors.black),
  );
}
