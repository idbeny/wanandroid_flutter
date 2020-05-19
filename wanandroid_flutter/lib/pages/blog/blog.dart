import 'package:flutter/material.dart';
import '../search/search.dart';
import '../../common/config/global_config.dart';
import 'blog_content.dart';

class YBBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalConfig.tab_title_blog),
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
      ),
      body: YBBlogContent(),
    );
  }
}
