import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var lightTheme = ThemeData(
  fontFamily: 'Roboto-Regular',
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(width: 3, color: Colors.blueAccent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: Colors.black),
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    iconColor: Colors.black,
    suffixIconColor: Colors.black,
    prefixIconColor: Colors.black,
  ),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
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
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
    ),
  ),
);

var darkTheme = ThemeData(
  fontFamily: 'Roboto-Regular',
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(width: 3, color: Colors.blueAccent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: Colors.white),
    ),
    hintStyle: TextStyle(
      color: Colors.white,
    ),
    labelStyle: TextStyle(
      color: Colors.white,
    ),
    iconColor: Colors.white,
    suffixIconColor: Colors.white,
    prefixIconColor: Colors.white,
  ),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color.fromARGB(255, 24, 25, 26),
    selectedItemColor: Colors.blue,
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
    subtitle1: TextStyle(
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
    ),
  ),
);
