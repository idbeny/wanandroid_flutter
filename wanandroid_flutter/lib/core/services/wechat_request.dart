import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/services/http_request.dart';
import 'package:wanandroid_flutter/core/model/classify_model.dart';
import 'package:wanandroid_flutter/core/model/article_item_model.dart';

// 微信公众号页面数据请求
class YBWeChatRequest {
  // 分类
  static Future requestClassify() async {
    final String url = "/wxarticle/chapters/json";
    final result = await HttpRequest.request(url: url);
    final list = result["data"];

    List<YBClassifyItemModel> items = [];
    for (var item in list) {
      items.add(YBClassifyItemModel.fromJson(item));
    }
    return items;
  }

  // 列表
  static Future requestList({@required String classifyId, int page}) async {
    final String url = "/wxarticle/list/$classifyId/$page/json";
    final result = await HttpRequest.request(url: url);
    final list = result["data"]["datas"];

    List<YBArticleItemModel> items = [];
    for (var item in list) {
      items.add(YBArticleItemModel.fromJson(item));
    }
    return items;
  }
}
