import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaowu/page/login/LoginPage.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class MyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyPageState();

}

class MyPageState extends State<MyPage>{

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
    ScreenUtil(width: 375, height: 812, allowFontScaling: true)
      ..init(context);

    Widget quitBtnSection = Opacity(
      opacity: 1,
      child: Container(
        height: ScreenUtil().setHeight(49),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorUtil.fromHex("#F76600"),
              ColorUtil.fromHex("#FCA000")
            ],
          ),
          borderRadius: BorderRadius.circular(24.5),
        ),
        child: TextButton(
          style: ButtonStyle(
            //设置水波纹颜色 透明
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            '退出登录',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () =>{
            _quitLogin()
          },
        ),
      ),
    );


    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            quitBtnSection
          ],
        ),
      ),
    );
  }


  _quitLogin()async{
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final _preferences = await preferences;
    _preferences.clear();
    Navigator.pushAndRemoveUntil(
      context,
      new MaterialPageRoute(builder: (context) => new LoginPage()),
          (route) => route == null,
    );
  }
}