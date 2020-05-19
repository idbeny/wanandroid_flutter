import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter/pages/projects/projects_classify_model.dart';
import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/service/http_request.dart';

class YBProjectsRequest {
  // 请求分类
  static Future requestClassify() async {
    final String url = "/project/tree/json";

    final result = await HttpRequest.request(url: url);
    final list = result["data"];

    List<YBProjectsClassifyItemModel> items = [];
    for (var item in list) {
      items.add(YBProjectsClassifyItemModel.fromMap(item));
    }
    return items;
  }

  // 请求列表数据
  static Future requestList({@required String classifyId, int page}) async {
    final String url = "/project/list/$page/json?cid=$classifyId";

    final result = await HttpRequest.request(url: url);
    final list = result["data"]["datas"];

    List<YBArticleItemModel> items = [];
    for (var item in list) {
      items.add(YBArticleItemModel.fromMap(item));
    }
    return items;
  }
}