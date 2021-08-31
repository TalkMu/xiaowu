import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaowu/page/home/HomePage.dart';
import 'package:xiaowu/page/login/LoginPage.dart';
import 'package:xiaowu/page/message/MessagePage.dart';
import 'package:xiaowu/page/my/MyPage.dart';
import 'package:xiaowu/page/robot/RobotPage.dart';
import 'package:xiaowu/page/service/ServicePage.dart';
import 'package:xiaowu/util/BaseUtil.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage> {
  // 当前页面标识
  int _currentPage = 0;
  bool loginState = false;
  final List<Widget> _pages = [
    HomePage(),
    ServicePage(),
    RobotPage(),
    MessagePage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    if(!loginState){
      return LoginPage();
    }
    return Scaffold(
      body: _pages[_currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new RobotPage();
          }));
        },
        child: Image.asset("assets/images/tab_bar/robot.png",
            width: ScreenUtil.getInstance().getWidth(34),
            height: ScreenUtil.getInstance().getHeight(60)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (int index) {
          setState(() {
            this._currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/home.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            activeIcon: Image.asset("assets/images/tab_bar/home_selected.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/service.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            activeIcon: Image.asset(
                "assets/images/tab_bar/service_selected.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            label: "服务",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/robot.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            activeIcon: Image.asset("assets/images/tab_bar/robot.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/message.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            activeIcon: Image.asset(
                "assets/images/tab_bar/message_selected.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/my.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            activeIcon: Image.asset("assets/images/tab_bar/my_selected.png",
                width: ScreenUtil.getInstance().getWidth(20),
                height: ScreenUtil.getInstance().getHeight(20)),
            label: "我的",
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future _checkLogin() async{
    String token = BaseUtil.getToken();
    if (token == '') {
      loginState = false;
      print("未登录 跳转登录页面");
    } else {
      loginState =true;
      print("已登录 token:" + token);
    }
  }
}
