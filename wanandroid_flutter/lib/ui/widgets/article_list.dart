import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/model/article_item_model.dart';
import 'package:wanandroid_flutter/core/services/projects_request.dart';
import 'package:wanandroid_flutter/core/services/wechat_request.dart';
import 'package:wanandroid_flutter/ui/pages/detail/detail.dart';
import 'article_item.dart';

// 文章列表
class YBArticleListView extends StatefulWidget {
  // 分类id
  final String classifyId;
  // 已请求好的文章数据（和分类id互斥）
  final List<YBArticleItemModel> itemModels;
  // 是否微信页面进入（需要单独请求数据，和上面两个属性互斥）
  final bool isWeChatPage;

  YBArticleListView({String classifyId, List<YBArticleItemModel> itemModels, bool isWeChatPage}) : this.classifyId = classifyId, this.itemModels = itemModels ?? [], this.isWeChatPage = isWeChatPage ?? false;

  @override
  _YBArticleListViewState createState() => _YBArticleListViewState();
}

class _YBArticleListViewState extends State<YBArticleListView> with AutomaticKeepAliveClientMixin {
  // 列表数据
  List<YBArticleItemModel> _itemModels = [];
  // 当前请求页码
  int _page = 1;
  // 是否正在刷新
  bool _isRefreshing = true;

  // 是否显示返回顶部按钮
  bool _showUpTopBtn = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 请求数据
    this.refreshData();
    // 滚动监听
    _scrollController.addListener(() {
      setState(() {
        _showUpTopBtn = _scrollController.offset > 500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _isRefreshing = true;
            });
            _page++;
            this.refreshData();
          },
          child: ListView.builder(
            controller: _scrollController,
          itemCount: _itemModels.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(YBDetailPage.routerName, arguments: _itemModels[index].title);
                },
                  child: YBArticleItem(_itemModels[index])
              );
            }),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: _showUpTopBtn ? FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ) : Offstage(),
        ),
        if (_isRefreshing) Center(child: Container( width: 80, height: 80, child: RefreshProgressIndicator()))
      ]
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void refreshData() {
    if (widget.classifyId != null) {
      if (widget.isWeChatPage) {
        YBWeChatRequest.requestList(classifyId: widget.classifyId, page: _page).then((value){
          _isRefreshing = false;
          setState(() {
            _itemModels.addAll(value);
          });
        });
      } else {
        YBProjectsRequest.requestList(classifyId: widget.classifyId, page: _page ).then((value){
          _isRefreshing = false;
          setState(() {
            _itemModels.addAll(value);
          });
        });
      }
    } else {
      _isRefreshing = false;
      setState(() {
        _itemModels.addAll(widget.itemModels);
      });
    }
  }
}
