import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/ui/main/bottom_navigation.dart';
import 'system_content.dart';

// 体系页面
class YBSystemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(BottomNavBars.navTitleSystem),),
      body: YBSystemContent(),
    );
  }
}
