import 'package:formletics/common/themes/app_colors.dart';
import 'package:formletics/common/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primarySwatch: _primarySwatch,
    primaryColor: _primaryColor,
    hintColor: _hintColor,
    appBarTheme: _appBarTheme,
    //buttonTheme: _buttonTheme,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    unselectedWidgetColor: _unselectedWidgetColor,
    accentColor: _primaryColor,
    textTheme: TextTheme(
      caption: TextStyle(color: AppColors.white, fontSize: 9),
      bodyText2: TextStyle(color: AppColors.white, fontSize: 10),
    ),
    // cardTheme: CardTheme(
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10))))
  );

  static final MaterialColor _primarySwatch =
      hexColor2MaterialColor(0xFF246BB3);
  static const Color _primaryColor = Color(0xFF246BB3);
  static const Color _hintColor = Color(0xffaaaaaa);
  static const Color _unselectedWidgetColor = Color(0xffcccccc);
  static final Color _scaffoldBackgroundColor = AppColors.darkModeBlack;

  static final AppBarTheme _appBarTheme = AppBarTheme(
      color: AppColors.darkModeBlack,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: AppColors.white),
      textTheme: const TextTheme(
          headline5: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
              fontSize: 14)));

  // static final ButtonThemeData _buttonTheme = ButtonThemeData(
  //   height: 48,
  //   padding: const EdgeInsets.only(left: 24, right: 24),
  //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(28),
  //   ),
  //   splashColor: Colors.transparent,
  // );
}
