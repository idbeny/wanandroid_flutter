import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/common/empty_holder.dart';
import 'package:wanandroid_flutter/pages/projects/projects_classify_model.dart';
import 'package:wanandroid_flutter/service/projects_request.dart';
import 'package:wanandroid_flutter/widgets/list_item.dart';
import 'package:wanandroid_flutter/widgets/list_page.dart';
import 'projects_content.dart';
import '../../common/config/global_config.dart';

class YBProjectsPage extends StatefulWidget {
  static const String routerName = "projects";

  @override
  _YBProjectsPageState createState() => _YBProjectsPageState();
}

class _YBProjectsPageState extends State<YBProjectsPage> with SingleTickerProviderStateMixin {
  List<YBProjectsClassifyItemModel> _classifyModels = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    YBProjectsRequest.requestClassify().then((items) {
      _classifyModels.addAll(items);
      _tabController = TabController(length: _classifyModels.length, vsync: this);
      setState(() {
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
        title: Text(GlobalConfig.tab_title_project),
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
          ) : YBEmptyHolder(),
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
    ) : YBEmptyHolder();
  }

  // 分类对应的页面内容
  List<Widget> _pageViews() {
    return List.generate(_classifyModels.length, (index) {
              return YBListPage(classifyId: _classifyModels[index].id.toString());
          });
  }
}
