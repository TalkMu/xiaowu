import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xiaowu/page/home/HomePage.dart';
import 'package:xiaowu/page/service/ServicePage.dart';

class TabBarPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>TabBarPageState();
}

class TabBarPageState extends State<TabBarPage>{
  // 当前页面标识
  int _currentPage = 0;
  final List<Widget> _pages = [HomePage(),ServicePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (int index){
          setState(() {
            this._currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("images/tab_bar/home.png",width: 20,height: 20),
            activeIcon: Image.asset("images/tab_bar/home_selected.png",width: 20,height: 20),
            label:"首页",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/tab_bar/service.png",width: 20,height: 20),
            activeIcon: Image.asset("images/tab_bar/service_selected.png",width: 20,height: 20),
            label: "服务",
          )
        ],
      ),
    );
  }
}