import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/core/model/article_item_model.dart';
import 'package:wanandroid_flutter/core/services/wechat_request.dart';
import 'package:wanandroid_flutter/ui/widgets/article_list.dart';

// 公众号页面-内容
class YBWeChatContent extends StatefulWidget {
  @override
  _YBWeChatContentState createState() => _YBWeChatContentState();
}

class _YBWeChatContentState extends State<YBWeChatContent> {
  List<YBArticleItemModel> _modelList = [];

  void initState() {
    YBWeChatRequest.requestList().then((items) {
      setState(() {
        _modelList.addAll(items);
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return YBArticleListView(itemModels:_modelList);
  }
}
