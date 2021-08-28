import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:xiaowu/page/login/LoginPage.dart';
import 'package:xiaowu/page/tab_bar/TabBarPage.dart';

import 'common/Global.dart';

void main() async {
  Global.init(() {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "小五管家Plus",
      debugShowCheckedModeBanner: false,
      // Scaffold 定义导航头部和页面主要内容
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      builder: EasyLoading.init(),
    );
  }
}
