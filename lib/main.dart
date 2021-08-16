import 'package:flutter/material.dart';
import 'package:xiaowu/page/tab_bar/TabBarPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold 定义导航头部和页面主要内容
      home: TabBarPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
