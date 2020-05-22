import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/core/common/unknown_page.dart';
import 'package:wanandroid_flutter/ui/main/app.dart';
import 'package:wanandroid_flutter/ui/pages/detail/detail.dart';
import 'package:wanandroid_flutter/ui/pages/search/search.dart';

// 路由配置
class YBRouter {
  // 初始化路由
  static final String initialRoute = YBApp.routerName;

  // 路由映射表
  static final Map<String, WidgetBuilder> routers = {
    YBApp.routerName : (ctx) => YBApp(),
    YBSearchPage.routerName : (ctx) => YBSearchPage(),
  };

  // 跳转拦截
  static final RouteFactory generateRoute = (RouteSettings settings) {
    if (settings.name == YBDetailPage.routerName) { // 详情
      return MaterialPageRoute(builder: (BuildContext context) {
        return YBDetailPage(settings.arguments);
      });
    }
    return null;
  };

  // 未知跳转
  static final RouteFactory unknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) => YBUnknownPage()
    );
  };
}