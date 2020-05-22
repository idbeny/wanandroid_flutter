import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/ui/pages/profile/profile_drawer.dart';

import 'bottom_navigation.dart';

// 应用入口
class YBApp extends StatefulWidget {
  static const String routerName = "/";

  @override
  _YBAppState createState() => _YBAppState();
}

class _YBAppState extends State<YBApp> with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: Drawer(child: YBProfileDrawerPage(),),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: BottomNavBars.titleFontSize,
          unselectedFontSize: BottomNavBars.titleFontSize,
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: BottomNavBars.items
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // 主体内容
  Widget _getBody() {
    return PageView(
      controller: _pageController,
      children: BottomNavBars.navStackPages,
    );
  }

  // 点击导航
  _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(_currentIndex);
    });
  }
}