import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var darkTheme = ThemeData(
  primaryColor: Color.fromARGB(225, 239, 54, 81),
  useMaterial3: true,
  fontFamily: 'Roboto-Regular',
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide:
          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 44, 54)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Color.fromARGB(255, 42, 44, 54)),
    ),
    hintStyle: const TextStyle(
      color: Color.fromARGB(255, 171, 180, 189),
    ),
    labelStyle: const TextStyle(
      color: Color.fromARGB(255, 171, 180, 189),
    ),
    iconColor: Colors.black,
    suffixIconColor: Colors.black,
    prefixIconColor: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black,
    selectedItemColor: Color.fromARGB(225, 239, 54, 81),
    unselectedItemColor: Color.fromARGB(255, 171, 180, 189),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 249, 249, 249),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 32, 31, 31),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color.fromARGB(255, 32, 31, 31),
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
    ),
  ),
);
