import 'package:flutter/material.dart';
import 'system_content.dart';
import '../../common/config/global_config.dart';

class YBSystemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GlobalConfig.tab_title_system),),
      body: YBSystemContent(),
    );
  }
}
