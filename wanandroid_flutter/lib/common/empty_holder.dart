import 'package:flutter/material.dart';

class YBEmptyHolder extends StatelessWidget {
  final String title;
  
  YBEmptyHolder([String title]) : this.title = "正在加载……";
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
    );
  }
}

