import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:xiaowu/page/home/HomePage.dart';
import 'package:xiaowu/page/login/CheckPage.dart';
import 'package:xiaowu/page/login/LoginPage.dart';
import 'package:xiaowu/page/tab_bar/TabBarPage.dart';
import 'package:xiaowu/test1.dart';
import 'package:xiaowu/test2.dart';

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
      initialRoute:"test1", // 名为"/"的路由作为应用的home(首页)
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      builder: EasyLoading.init(),
      routes: {
        "/":(context)=>TabBarPage(),
        "home":(context)=>HomePage(),
        "login":(context)=>LoginPage(),
      },
    );
  }
}
