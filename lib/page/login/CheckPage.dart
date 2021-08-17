import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaowu/util/ColorUtil.dart';
import 'package:flutter_verification_box/verification_box.dart';

class CheckPage extends StatefulWidget{

  @override
  State createState() {
    return new _CheckPage();
  }

}
class _CheckPage extends State<CheckPage>{
  // 倒计时秒数
  int _seconds = 60;

  String _verifyStr = '获取验证码';

  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);
    this._startTimer();
    Widget labelSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("手机验证码",style: TextStyle(
              color: ColorUtil.fromHex("#161833"),
              fontSize: 24
            ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text("请输入手机验证码",style: TextStyle(
                color: ColorUtil.fromHex("#94969E"),
                fontSize: 14
            ),),
          )
        ],
      ),
    );
    Widget codeSection = Container(
      child:Container(
        height: 45,
        child: VerificationBox(
          count: 6,
          textStyle: TextStyle(color: ColorUtil.fromHex("#FFFFFF"),fontSize: 24),
          decoration: BoxDecoration(
            color: ColorUtil.fromHex("#F76C00"),
            borderRadius: BorderRadius.circular(5)
          ),
          borderColor: ColorUtil.fromHex("#F76C00"),
          focusBorderColor: Colors.lightBlue,
          onSubmitted: (value){
            print(value);
          },
        ),
      )
    );

    Widget countDownSection = Container(
      child: Row(
        children: [
          Container(
            child: Text(_verifyStr.toString(),style: TextStyle(color: ColorUtil.fromHex("#F76C00"),fontSize: 14),),
          )
        ],
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/login/bg.png"),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
          child: new ListView(
            children: [
              new SizedBox(height: ScreenUtil().setHeight(184),),
              labelSection,
              new SizedBox(height: ScreenUtil().setHeight(37),),
              codeSection,
              new SizedBox(height: ScreenUtil().setHeight(16),),
              countDownSection
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_seconds != 0){
          _seconds--;
          this._verifyStr = _seconds.toString() + "秒后重新获取";
        }else{
          this._verifyStr = "获取验证码";
        }
      });
    });
  }
}