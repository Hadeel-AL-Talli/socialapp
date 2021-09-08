import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/style/colors.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: defaultColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
        color: HexColor('333739'),
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Jannah',
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: HexColor('333739')),
    textTheme: TextTheme(
        subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Jannah',
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.3
        ),
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Jannah',
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )));

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: Colors.deepOrange
    // ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(color: Colors.black),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        color: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Jannah',
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white),
    textTheme: TextTheme(
        subtitle1: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Jannah',
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.3
        ),
        bodyText1: TextStyle(
          fontSize: 15.0,
          fontFamily: 'Jannah',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )));
