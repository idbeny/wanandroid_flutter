import 'package:flutter/material.dart';

// 空页面背景提示
class YBEmptyPage extends StatelessWidget {
  final String title;

  YBEmptyPage([String title]) : this.title = "暂无数据";
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}

