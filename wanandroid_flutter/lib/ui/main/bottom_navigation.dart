import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/common/IconF.dart';
import 'package:wanandroid_flutter/ui/pages/blog/blog.dart';
import 'package:wanandroid_flutter/ui/pages/profile/profile.dart';
import 'package:wanandroid_flutter/ui/pages/projects/projects.dart';
import 'package:wanandroid_flutter/ui/pages/system/system.dart';
import 'package:wanandroid_flutter/ui/pages/wechat/wechat.dart';

class BottomNavBars {
  // 导航标题
  static String navTitleBlog = "博文";
  static String navTitleProject = "项目";
  static String navTitleWeChat = "公众号";
  static String navTitleSystem = "体系";
  static String navTitleProfile = "我";

  // 底部导航元素
  static List<BottomNavigationBarItem> items = [
    _getNavBarItem(icon: Icon(IconF.blog),    title: navTitleBlog),
    _getNavBarItem(icon: Icon(IconF.project), title: navTitleProject),
    _getNavBarItem(icon: Icon(IconF.wechat),  title: navTitleWeChat),
    _getNavBarItem(icon: Icon(IconF.system),  title: navTitleSystem),
    _getNavBarItem(icon: Icon(IconF.profile), title: navTitleProfile),
  ];

  static BottomNavigationBarItem _getNavBarItem({Widget icon, String title }) {
    return BottomNavigationBarItem(
        icon:  icon,
        title: Text(title)
    );
  }

  // 元素字体大小
  static const double titleFontSize = 14;

  // 首页页面
  static final List<Widget> navStackPages = [
    YBBlogPage(),
    YBProjectsPage(),
    YBWeChatPage(),
    YBSystemPage(),
    YBProfilePage()
  ];
}
