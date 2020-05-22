import 'package:flutter/material.dart';
import 'search_content.dart';

class YBSearchPage extends StatelessWidget {
  static const String routerName = "search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("搜索"),),
      body: YBSearchContent(),
    );
  }
}
