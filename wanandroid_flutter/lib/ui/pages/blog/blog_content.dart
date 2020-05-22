import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/core/model/article_item_model.dart';
import 'package:wanandroid_flutter/core/services/blog_request.dart';
import 'package:wanandroid_flutter/ui/pages/detail/detail.dart';
import 'package:wanandroid_flutter/ui/widgets/article_item.dart';

// 博客页面-内容
class YBBlogContent extends StatefulWidget {
  @override
  _YBBlogContentState createState() => _YBBlogContentState();
}

class _YBBlogContentState extends State<YBBlogContent>
    with AutomaticKeepAliveClientMixin {
  // 列表数据
  List<YBArticleItemModel> _itemModels = [];

  // 当前请求页码
  int _page = 1;

  // 是否正在刷新
  bool _isRefreshing = true;

  // 是否显示返回顶部按钮
  bool _showUpTopBtn = false;
  ScrollController _scrollController = ScrollController();

  RefreshState _curRefreshState = RefreshState.idle;
  bool _pointerDownUp = false;

  @override
  void initState() {
    // 数据请求
    this._requestData();

    // 滚动监听
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double maxExtent = _scrollController.position.maxScrollExtent;

      if (offset < -70) {
        if (_curRefreshState == RefreshState.refreshingHeader) return;
        // 下拉刷新
        _curRefreshState = RefreshState.pulling;
        print("松开即可刷新");
        if (_pointerDownUp) {
          _curRefreshState = RefreshState.refreshingHeader;
          _pointerDownUp = false;
          _scrollController.animateTo(-50, duration: Duration(milliseconds: 300), curve: Curves.easeIn).whenComplete(() {
            print("正在请求");
            _scrollController.jumpTo(-50.0);
            Timer(Duration(seconds: 3), () {
              print("请求完成");
//              _curRefreshState = RefreshState.idle;
              _scrollController.jumpTo(-160);
            });
          });
          print("开始刷新");
        }
      } else if (maxExtent - offset < 50) {
        // 上拉加载
        if (_curRefreshState == RefreshState.refreshingFooter) return;
        _curRefreshState = RefreshState.refreshingFooter;
        _scrollController.jumpTo(maxExtent);
        print("正在加载更多");
      } else {
        // 闲置
//        _curRefreshState = RefreshState.idle;
      }
      setState(() {
        _showUpTopBtn = _scrollController.offset > 500;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      RefreshIndicator(
        onRefresh: () async {
          this._requestData();
        },
        child: Listener(
          onPointerUp: (events) {
            print(events);
            _pointerDownUp = true;
          },
          child: ListView.builder(
              controller: _scrollController,
              itemCount: _itemModels.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(YBDetailPage.routerName,
                          arguments: _itemModels[index].title);
                    },
                    child: YBArticleItem(_itemModels[index]));
              }),
        ),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: Offstage(
          offstage: !_showUpTopBtn,
          child: FloatingActionButton(
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ),
        ),
      ),
    ]);
  }

  // 请求数据
  void _requestData() {
    _isRefreshing = true;
    YBBlogRequest.requestList(_page).then((items) {
      _page++;
      _isRefreshing = false;
      setState(() {
        _itemModels.addAll(items);
      });
    }).catchError((error) {
      print("错误");
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// 刷新状态
enum RefreshState {
  /// 普通闲置状态
  idle,

  /// 松开就可以进行刷新的状态
  pulling,

  /// 正在刷新中的状态
  refreshingHeader,

  /// 正在刷新中的状态
  refreshingFooter,

  /// 所有数据加载完毕，没有更多的数据了
  noMoreData
}
