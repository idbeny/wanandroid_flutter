import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/service/blog_request.dart';
import 'package:wanandroid_flutter/widgets/list_page.dart';

class YBBlogContent extends StatefulWidget {
  @override
  _YBBlogContentState createState() => _YBBlogContentState();
}

class _YBBlogContentState extends State<YBBlogContent> {
  int page = 0;
  List<YBArticleItemModel> _modelList = [];
  @override
  void initState() {
    YBBlogRequest.requestList(page).then((items) {
      page++;
      setState(() {
        _modelList.addAll(items);
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return YBListPage(itemModels:_modelList, key: UniqueKey(),);
  }
}
