import 'package:flutter/material.dart';

// 应用主题配置
class YBAppTheme {
 // 字体大小
 static const double bodyFontSize = 14;
 static const double display1FontSize = 16;
 static const double display2FontSize = 20;
 static const double display3FontSize = 24;
 static const double display4FontSize = 30;

 // 高亮模式-文字颜色
 static const Color _brightTextColor = Colors.black87;

 // 普通/高亮模式
 static final ThemeData brightTheme = ThemeData(
   primarySwatch: Colors.red,
   canvasColor: Colors.white,
   splashColor: Colors.transparent,
   highlightColor: Colors.transparent,
   textTheme: TextTheme(
     body1: TextStyle(fontSize: bodyFontSize, color: _brightTextColor),
     display1: TextStyle(fontSize: display1FontSize, color: _brightTextColor),
     display2: TextStyle(fontSize: display2FontSize, color: _brightTextColor),
     display3: TextStyle(fontSize: display3FontSize, color: _brightTextColor),
     display4: TextStyle(fontSize: display4FontSize, color: _brightTextColor, fontWeight: FontWeight.w400),
   )
 );

 // 暗黑模式-文字颜色
 static const Color _dartTextColor = Colors.white10;

 // 夜间/暗黑模式
 static final ThemeData dartTheme = ThemeData(
   primarySwatch: Colors.grey,
   canvasColor: Colors.grey.withOpacity(0.7),
   splashColor: Colors.transparent,
   highlightColor: Colors.transparent,
   textTheme: TextTheme(
     body1: TextStyle(fontSize: bodyFontSize, color: _dartTextColor),
     display1: TextStyle(fontSize: display1FontSize, color: _dartTextColor),
     display2: TextStyle(fontSize: display2FontSize, color: _dartTextColor),
     display3: TextStyle(fontSize: display3FontSize, color: _dartTextColor),
     display4: TextStyle(fontSize: display4FontSize, color: _dartTextColor, fontWeight: FontWeight.w400),
   )
 );
}
