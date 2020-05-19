import 'package:flutter/material.dart';

class YBProjectsContent extends StatefulWidget {
  @override
  _YBProjectsContentState createState() => _YBProjectsContentState();
}

class _YBProjectsContentState extends State<YBProjectsContent> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabC;
  @override
  void initState() {
    // TODO: implement initState
    _tabC = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(fontSize: 20, color: Colors.black);
    return TabBar(
      tabs: List.generate(10, (index) {
        return Text("data$index",style: style,);
      }),
      isScrollable: true,
      controller: _tabC,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
