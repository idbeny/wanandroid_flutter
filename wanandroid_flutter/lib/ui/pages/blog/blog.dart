import 'package:flutter/material.dart';

import '../profile/profile_drawer.dart';
import 'blog_app_bar.dart';
import 'blog_content.dart';

// 博客页面
class YBBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YBBlogAppBar(context),
      body: YBBlogContent(),
    );
  }
}
