import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
);