import 'package:flutter/material.dart';

class YBDetailPage extends StatelessWidget {
  static const String routerName = "/detail";

  final String detailId;
  YBDetailPage(this.detailId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(detailId),),
      body: YBDetailContent(),
    );
  }
}

class YBDetailContent extends StatefulWidget {
  @override
  _YBDetailContentState createState() => _YBDetailContentState();
}

class _YBDetailContentState extends State<YBDetailContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("详情页"),
    );
  }
}
