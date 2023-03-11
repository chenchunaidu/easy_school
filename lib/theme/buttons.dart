import 'package:flutter/material.dart';

const padding = EdgeInsets.only(left: 24, right: 24, top: 9, bottom: 9);
const fontWeight = FontWeight.w700;

var textButtonTheme =
    TextButtonThemeData(style: TextButton.styleFrom(padding: padding));

var elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, padding: padding));

var outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        padding: padding,
        backgroundColor: Colors.grey.shade50,
        side: BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.black)));
