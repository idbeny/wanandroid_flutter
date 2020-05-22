import 'package:wanandroid_flutter/core/services/http_request.dart';
import 'package:wanandroid_flutter/core/model/article_item_model.dart';

// 博客页面数据请求
class YBBlogRequest {
  static Future requestList(int page) async {
    final String listURL = "/article/list/$page/json";
    final result = await HttpRequest.request(url: listURL);
    final list = result["data"]["datas"];

    List<YBArticleItemModel> items = [];
    for (var item in list) {
      items.add(YBArticleItemModel.fromJson(item));
    }
    return items;
  }
}
