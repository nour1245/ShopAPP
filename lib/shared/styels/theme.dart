import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.green,
  fontFamily: 'Roboto-Regular',
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(width: 3, color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Colors.black),
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
    ),
    labelStyle: const TextStyle(
      color: Colors.grey,
    ),
    iconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
  ),
  primarySwatch: Colors.green,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.green,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto-Regular',
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(width: 3, color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
    hintStyle: const TextStyle(
      color: Colors.white,
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
    ),
    iconColor: Colors.white,
    suffixIconColor: Colors.white,
    prefixIconColor: Colors.white,
  ),
  primarySwatch: Colors.green,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color.fromARGB(255, 24, 25, 26),
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 32, 31, 31),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
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
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
    ),
  ),
);
