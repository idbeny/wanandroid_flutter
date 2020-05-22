import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/model/article_item_model.dart';
import 'package:wanandroid_flutter/core/services/blog_request.dart';
import 'package:wanandroid_flutter/ui/widgets/article_item.dart';
import 'package:wanandroid_flutter/core/common/empty_page.dart';

class YBProfileContent extends StatefulWidget {
  @override
  _YBProfileContentState createState() => _YBProfileContentState();
}

class _YBProfileContentState extends State<YBProfileContent> {
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
    return _modelList.length != 0 ? CustomScrollView(

      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("User Name", style: TextStyle(fontSize: 20),),
            background: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("http://d.ifengimg.com/w600/p0.ifengimg.com/pmop/2018/0805/23222561FF70DBF8C8800E6A8DACE0219B187535_size39_w640_h640.jpeg")),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(75)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return YBArticleItem(_modelList[index]);
            }),
        )
      ],
    ) : YBEmptyPage();
  }
}
