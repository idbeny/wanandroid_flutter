import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/ui/main/app_theme.dart';
import 'core/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: YBRouter.initialRoute,
      routes: YBRouter.routers,
      onGenerateRoute: YBRouter.generateRoute,
      onUnknownRoute: YBRouter.unknownRoute,
      theme: YBAppTheme.brightTheme,
      darkTheme: YBAppTheme.dartTheme,
    );
  }
}




