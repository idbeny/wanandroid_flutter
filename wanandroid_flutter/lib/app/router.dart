import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/detail/detail.dart';

import '../pages/blog/blog.dart';
import '../pages/projects/projects.dart';
import '../pages/wechat/wechat.dart';
import '../pages/system/system.dart';
import '../pages/profile/profile.dart';
import '../pages/search/search.dart';
import '../pages/unknown.dart';

class YBRouter {
  static final Map<String, WidgetBuilder> routers = {
    YBProjectsPage.routerName : (ctx) => YBProjectsPage(),
    YBSearchPage.routerName : (ctx) => YBSearchPage(),
  };

  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    if (settings.name == YBDetailPage.routerName) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return YBDetailPage(settings.arguments);
      });
    }
    return null;
  };

  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) => YBUnknownPage()
    );
  };
}

List<Widget> pages = [
  YBBlogPage(),
  YBProjectsPage(),
  YBWechatPage(),
  YBSystemPage(),
  YBProfilePage()
];