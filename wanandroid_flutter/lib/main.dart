import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app/bottom_navigation_bar.dart';

import 'app/router.dart';
import 'common/config/global_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: YBRouter.routers,
      onGenerateRoute: YBRouter.onGenerateRoute,
      onUnknownRoute: YBRouter.onUnknownRoute,
      theme: ThemeData(
          primarySwatch: GlobalConfig.color_primary,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
      ),
      home: YBApp(),
    );
  }
}

class YBApp extends StatefulWidget {
  @override
  _YBAppState createState() => _YBAppState();
}

class _YBAppState extends State<YBApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          selectedFontSize: BottomTabBars.titleFontSize,
          unselectedFontSize: BottomTabBars.titleFontSize,
          fixedColor: GlobalConfig.color_primary,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: BottomTabBars.items),
    );
  }
}


