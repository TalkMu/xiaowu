import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/page/tab_bar/TabBarPage.dart';

void main() {
  LogUtil.init(isDebug: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "小五管家Plus",
      debugShowCheckedModeBanner: false,
      // Scaffold 定义导航头部和页面主要内容
      home: TabBarPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
