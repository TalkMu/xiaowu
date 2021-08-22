
import 'package:flutter/material.dart';
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
  final List<Widget> _pages = [
    HomePage(),
    ServicePage(),
    RobotPage(),
    MessagePage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new RobotPage();
          }));
        },
        child: Image.asset("assets/images/tab_bar/robot.png",
            width: 34, height: 60),
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
                width: 20, height: 20),
            activeIcon: Image.asset("assets/images/tab_bar/home_selected.png",
                width: 20, height: 20),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/service.png",
                width: 20, height: 20),
            activeIcon: Image.asset(
                "assets/images/tab_bar/service_selected.png",
                width: 20,
                height: 20),
            label: "服务",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/robot.png",
                width: 20, height: 20),
            activeIcon: Image.asset("assets/images/tab_bar/robot.png",
                width: 20, height: 20),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/message.png",
                width: 20, height: 20),
            activeIcon: Image.asset(
                "assets/images/tab_bar/message_selected.png",
                width: 20,
                height: 20),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/tab_bar/my.png",
                width: 20, height: 20),
            activeIcon: Image.asset("assets/images/tab_bar/my_selected.png",
                width: 20, height: 20),
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

  _checkLogin(){
    String token = BaseUtil.getToken();
    if(token == ''){
      Navigator.pushAndRemoveUntil(
        context,
        new MaterialPageRoute(builder: (context) => new LoginPage()),
            (route) => route == null,
      );
      print("未登录 跳转登录页面");
    }else{
      print("已登录 token:" + token);
    }
  }
}
