import 'package:flutter/material.dart';

class AppTheme{
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  /// 普通模式
  static const Color normalTextColor = Colors.black;

  static ThemeData normalTheme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromARGB(255,254,222,1),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: normalFontSize,color: normalTextColor,
        ),
        // bodyText1: //这个不是 默认的 文字样式
      )
  );


  /// 暗黑模式
  static const Color darkTextColor = Colors.greenAccent;
  static ThemeData darkTheme = ThemeData(
//适配 暗黑模式的主题
      primarySwatch: Colors.grey,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: normalFontSize,color: darkTextColor,

          )
      )
  );
}