import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/common/fonts/IconF.dart';
import 'package:wanandroid_flutter/pages/blog/blog_model.dart';
import 'package:wanandroid_flutter/pages/projects/projects_model.dart';

class YBListItem extends StatefulWidget {
  final YBArticleItemModel itemModel;

  YBListItem(this.itemModel);

  @override
  _YBListItemState createState() => _YBListItemState();
}

class _YBListItemState extends State<YBListItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  children: _buildContentTop(),
                ),
              ),
              SizedBox(height: 10,),
              _buildContentFrom()
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContentTop() {
    List<Widget> widgets = [Expanded(child: _buildContent())];
    if (widget.itemModel.envelopePic.length != 0) {
      widgets.insertAll(0, [_buildImage(), SizedBox(width: 12.0)]);
    }
    return widgets;
  }

  Widget _buildContent() {
    List<Widget> widgets = [_buildContentTitle()];
    if (widget.itemModel.desc.length != 0) {
      widgets.add(_buildContentDesc());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _buildContentTitle() {
    return Text(
      widget.itemModel.title,
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
    );
  }

  Widget _buildContentDesc() {
    return Text(
      widget.itemModel.desc,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 15,
          color: Color(0xff666666)
      ),
    );
  }

  Widget _buildContentFrom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildContentFromTime(),
        SizedBox(height: 5,),
        _buildContentFromTag()
      ],
    );
  }
  
  Widget _buildContentFromTime() {
    String date = " ${widget.itemModel.niceDate}";
    String author = " @${widget.itemModel.author}";
    return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(child: Icon(IconF.time, size: 14,), baseline: TextBaseline.alphabetic, alignment: PlaceholderAlignment.top),
            WidgetSpan(child: Text("$date $author", style: TextStyle(fontSize: 16, color: Color(0xff666666)),), alignment: PlaceholderAlignment.middle)
          ]
        ),
    );
  }

  Widget _buildContentFromTag() {
    List<Widget> widgets = [];
    List<Widget> tagWidgets = _buildContentFromTagTitle();
    Widget proName = _buildContentFromProName();
    widgets.addAll(tagWidgets);
    widgets.add(proName);
    return Row(
      children: widgets,
    );
  }

  List<Widget> _buildContentFromTagTitle() {
    List<Widget> tagWidget = [];
    widget.itemModel.tags.forEach((item) {
      tagWidget.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(3)
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(item.name, style: TextStyle(fontSize: 12, color: Colors.green),),
            ),
        ));
    });
    return tagWidget;
  }
  
  Widget _buildContentFromProName() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text("${widget.itemModel.chapterName}", style: TextStyle(fontSize: 14, color: Color(0xff666666)),),
    );
  }
  

  Widget _buildImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(widget.itemModel.envelopePic, width: 80,),
      ],
    );
  }
}
