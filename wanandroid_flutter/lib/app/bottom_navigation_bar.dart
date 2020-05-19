import 'package:flutter/material.dart';
import '../common/config/global_config.dart';
import '../common/fonts/IconF.dart';

class BottomTabBars {
  // tabItem
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(IconF.blog),
        title: Text(GlobalConfig.tab_title_blog)
    ),
    BottomNavigationBarItem(
        icon: Icon(IconF.project),
        title: Text(GlobalConfig.tab_title_project)
    ),
    BottomNavigationBarItem(
        icon: Icon(IconF.wechat),
        title: Text(GlobalConfig.tab_title_wechat)
    ),
    BottomNavigationBarItem(
        icon: Icon(IconF.system),
        title: Text(GlobalConfig.tab_title_system)
    ),
    BottomNavigationBarItem(
        icon: Icon(IconF.profile),
        title: Text(GlobalConfig.tab_title_profile)
    )
  ];

  // 字体大小
  static const double titleFontSize = 14;
}
