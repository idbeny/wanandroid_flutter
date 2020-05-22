import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/ui/main/bottom_navigation.dart';
import 'package:wanandroid_flutter/ui/pages/search/search.dart';

// 博客页面-导航栏
class YBBlogAppBar extends AppBar {
  YBBlogAppBar(BuildContext context) : super(
    title: Text(BottomNavBars.navTitleBlog),
    leading: IconButton(
        icon: Icon(Icons.format_list_bulleted),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        }),
    actions: <Widget>[
      Container(
        width: 40,
        child: IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pushNamed(YBSearchPage.routerName);
            }),
      )
    ],
  );
}