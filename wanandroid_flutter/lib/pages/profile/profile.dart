import 'package:flutter/material.dart';
import 'profile_content.dart';
import '../../common/config/global_config.dart';

class YBProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GlobalConfig.tab_title_profile),),
      body: YBProfileContent(),
    );
  }
}
