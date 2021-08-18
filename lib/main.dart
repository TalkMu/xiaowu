import 'package:flutter/material.dart';
import 'package:xiaowu/page/login/CheckPage.dart';
import 'package:xiaowu/page/login/LoginPage.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold 定义导航头部和页面主要内容
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
