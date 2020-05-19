import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/service/http_request.dart';

class YBBlogRequest {
  static Future requestList(int page) async {
    final String listURL = "/article/list/$page/json";

    final result = await HttpRequest.request(url: listURL);
    final list = result["data"]["datas"];

    List<YBArticleItemModel> items = [];
    for (var item in list) {
      items.add(YBArticleItemModel.fromMap(item));
    }
    return items;
  }
}
