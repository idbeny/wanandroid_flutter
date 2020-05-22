import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wanandroid_flutter/core/common/IconF.dart';
import 'package:wanandroid_flutter/core/model/article_item_model.dart';

// 文章单个元素widget
class YBArticleItem extends StatelessWidget {
  final YBArticleItemModel itemModel;

  YBArticleItem(this.itemModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContent(),
                ),
              ),
              _buildContentSource()
            ],
          ),
        ),
      ),
    );
  }

  // 内容
  List<Widget> _buildContent() {
    List<Widget> widgets = [Expanded(child: _buildContentInfo())];
    if (itemModel.envelopePic.length != 0) {
      widgets.insertAll(0, [_buildImage(), SizedBox(width: 12.0)]);
    }
    return widgets;
  }

  // 标题/描述
  Widget _buildContentInfo() {
    List<Widget> widgets = [_buildContentInfoTitle()];
    if (itemModel.desc.length != 0) {
      widgets.add(_buildContentDesc());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  // 标题
  Widget _buildContentInfoTitle() {
    return Text(
      itemModel.title,
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
    );
  }

  // 描述
  Widget _buildContentDesc() {
    return Text(
      itemModel.desc,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 15,
          color: Color(0xff666666)
      ),
    );
  }

  // 来源
  Widget _buildContentSource() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildContentSourceTime(),
        SizedBox(height: 5,),
        _buildContentSourceTags()
      ],
    );
  }

  // 时间
  Widget _buildContentSourceTime() {
    String time = " ${itemModel.niceDate}";
    String author = "";
    if (itemModel.author.length != 0) {
      author = " @${itemModel.author}";
    }
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(child: Icon(IconF.time, size: 14,), baseline: TextBaseline.alphabetic, alignment: PlaceholderAlignment.top),
              WidgetSpan(child: Text("$time $author", style: TextStyle(fontSize: 16, color: Color(0xff666666)),), alignment: PlaceholderAlignment.middle)
            ]
          ),
      ),
    );
  }

  // 分类标签
  Widget _buildContentSourceTags() {
    List<Widget> widgets = [];
    List<Widget> tagWidgets = _buildContentSourceTagItem();
    widgets.addAll(tagWidgets);
    widgets.add(_buildContentSourceChapterName());
    return Row(
      children: widgets,
    );
  }

  // 构建标签
  List<Widget> _buildContentSourceTagItem() {
    List<Widget> tagWidget = [];
    itemModel.tags.forEach((item) {
      tagWidget.add(
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(3)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(item.name, style: TextStyle(fontSize: 12, color: Colors.green),),
            ),
        ));
    });
    return tagWidget;
  }

  // 章节
  Widget _buildContentSourceChapterName() {
    final parentName = "${itemModel.superChapterName}";
    final selfName = "${itemModel.chapterName}";
    final name = parentName.length != 0 ? "$parentName/$selfName" : "$selfName";
    return Text(name, style: TextStyle(fontSize: 14, color: Color(0xff666666)),);
  }
  
  // 图片
  Widget _buildImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(itemModel.envelopePic, width: 80,),
      ],
    );
  }
}
