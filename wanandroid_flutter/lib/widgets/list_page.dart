import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/pages/detail/detail.dart';
import 'package:wanandroid_flutter/pages/projects/projects_model.dart';
import 'package:wanandroid_flutter/service/projects_request.dart';
import 'package:wanandroid_flutter/service/wechat_request.dart';

import 'list_item.dart';

class YBListPage extends StatefulWidget {
  final String classifyId;
  final List<YBArticleItemModel> itemModels;
  final bool isWehatPage;
  YBListPage({String classifyId, List<YBArticleItemModel> itemModels, bool isWechatPage, Key key}) : this.classifyId = classifyId, this.itemModels = itemModels ?? [], this.isWehatPage = isWechatPage ?? false, super(key:key);

  @override
  _YBListPageState createState() => _YBListPageState();
}

class _YBListPageState extends State<YBListPage> with AutomaticKeepAliveClientMixin {
  List<YBArticleItemModel> _itemModels = [];
  int _page = 1;

  ScrollController _scrollController = ScrollController();

  bool _showUpTopBtn = false;

  @override
  void initState() {
    super.initState();
      if (widget.classifyId != null) {
        if (widget.isWehatPage) {
          YBWechatRequest.requestList(classifyId: widget.classifyId, page: _page).then((value){
            setState(() {
              _itemModels.addAll(value);
            });
          });
        } else {
          YBProjectsRequest.requestList(classifyId: widget.classifyId, page: _page ).then((value){
            setState(() {
              _itemModels.addAll(value);
            });
          });
        }
      } else {
        print(widget.itemModels);
        setState(() {
          _itemModels.addAll(widget.itemModels);
        });
      }

    _scrollController.addListener(() {
      setState(() {
        _showUpTopBtn = _scrollController.offset > 500;
      });
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
        itemCount: _itemModels.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(YBDetailPage.routerName, arguments: _itemModels[index].title);
              },
                child: YBListItem(_itemModels[index])
            );
          }),
        Positioned(
          right: 10,
          bottom: 10,
          child: _showUpTopBtn ? FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ) : Offstage(),
        )
      ]
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
