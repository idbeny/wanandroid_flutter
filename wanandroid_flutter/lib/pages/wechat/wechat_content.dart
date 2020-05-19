import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/service/wechat_request.dart';
import 'package:wanandroid_flutter/widgets/list_page.dart';

class YBWechatContent extends StatefulWidget {
  @override
  _YBWechatContentState createState() => _YBWechatContentState();
}

class _YBWechatContentState extends State<YBWechatContent> {
  List<YBArticleItemModel> _modelList = [];

  void initState() {
    YBWechatRequest.requestList().then((items) {
      setState(() {
        _modelList.addAll(items);
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return YBListPage(itemModels:_modelList);
  }
}
