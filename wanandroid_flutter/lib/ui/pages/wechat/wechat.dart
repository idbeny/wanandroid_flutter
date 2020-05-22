import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/common/empty_page.dart';
import 'package:wanandroid_flutter/core/model/classify_model.dart';
import 'package:wanandroid_flutter/core/services/wechat_request.dart';
import 'package:wanandroid_flutter/ui/main/bottom_navigation.dart';
import 'package:wanandroid_flutter/ui/widgets/article_list.dart';

// 公众号页面
class YBWeChatPage extends StatefulWidget {
  @override
  _YBWeChatPageState createState() => _YBWeChatPageState();
}

class _YBWeChatPageState extends State<YBWeChatPage> with TickerProviderStateMixin {

  List<YBClassifyItemModel> _classifyModels = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    YBWeChatRequest.requestClassify().then((items) {
      setState(() {
        _classifyModels.addAll(items);
        _tabController = TabController(length: _classifyModels.length, vsync: this);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BottomNavBars.navTitleWeChat),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: _tabController!=null ? TabBar(
            tabs: _getTabs(),
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18.0),
            unselectedLabelColor: Colors.grey[350],
            indicatorColor: Colors.white,
            indicatorWeight: 4,
          ) : YBEmptyPage(),
        ),

      ),
      body: _getBody(),
    );
  }

  // tab元素
  Widget _tabItem(title) {
    return Tab(text: title,);
  }

  // 分类列表
  List<Widget> _getTabs() {
    return _classifyModels.map((itemModel) {
      return _tabItem(itemModel.name);
    }).toList();
  }

  // 内容
  Widget _getBody() {
    return _tabController != null ? TabBarView(
        controller: _tabController,
        children: _pageViews()
    ) : YBEmptyPage();
  }

  // 分类对应的页面内容
  List<Widget> _pageViews() {
    return List.generate(_classifyModels.length, (index) {
      return YBArticleListView(isWeChatPage: true, classifyId: _classifyModels[index].id.toString());
    });
  }
}
