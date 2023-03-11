import 'package:flutter/material.dart';

var inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey.shade50,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.grey.shade800,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade800,
    ),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
);
