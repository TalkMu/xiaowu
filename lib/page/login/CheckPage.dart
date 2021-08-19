import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaowu/page/tab_bar/TabBarPage.dart';
import 'package:xiaowu/util/ColorUtil.dart';
import 'package:flutter_verification_box/verification_box.dart';

class CheckPage extends StatefulWidget {
  @override
  State createState() {
    return new _CheckPage();
  }
}

class _CheckPage extends State<CheckPage> {
  // 倒计时秒数
  int _seconds = 60;

  // 是否可以获取验证码 默认false
  bool available = false;

  // 定时器是否启动
  bool hasStartTimer = false;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    if (!hasStartTimer) {
      this.hasStartTimer = true;
      this._startTimer();
    }
    Widget labelSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "手机验证码",
              style:
                  TextStyle(color: ColorUtil.fromHex("#161833"), fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "请输入手机验证码",
              style:
                  TextStyle(color: ColorUtil.fromHex("#94969E"), fontSize: 14),
            ),
          )
        ],
      ),
    );
    Widget codeSection = Container(
        child: Container(
      height: 45,
      child: VerificationBox(
        count: 4,
        textStyle: TextStyle(color: ColorUtil.fromHex("#FFFFFF"), fontSize: 24),
        decoration: BoxDecoration(
            color: ColorUtil.fromHex("#F76C00"),
            borderRadius: BorderRadius.circular(5)),
        borderColor: ColorUtil.fromHex("#F76C00"),
        focusBorderColor: Colors.lightBlue,
        showCursor: true,
        cursorColor: Colors.white,
        onSubmitted: (value) {
          this.checkCode(value);
        },
      ),
    ));

    Widget countDownSection = this.available
        ? Container(
            child: GestureDetector(
            onTap: () {
              this._seconds = 60;
              this.available = false;
            },
            child: Text(
              "获取验证码",
              style:
                  TextStyle(color: ColorUtil.fromHex("#F76C00"), fontSize: 14),
            ),
          ))
        : Container(
            child: Row(
            children: [
              Container(
                width: 20,
                child: Text(
                  _seconds.toString(),
                  style: TextStyle(
                    color: ColorUtil.fromHex("#F76C00"),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "秒后重新获取",
                  style: TextStyle(
                    color: ColorUtil.fromHex("#94969E"),
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ));
    return Scaffold(
      //可以通过设置 这个属性 防止键盘 覆盖内容 或者 键盘 撑起内容
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/login/bg.png"),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: new ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              new SizedBox(
                height: ScreenUtil().setHeight(184),
              ),
              labelSection,
              new SizedBox(
                height: ScreenUtil().setHeight(37),
              ),
              codeSection,
              new SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
              countDownSection
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          setState(() {
            _seconds--;
          });
        } else if (_seconds == 0) {
          setState(() {
            this.available = true;
          });
        }
    });
  }

  void checkCode(String code){
    // 校验成功
    if(true){
      Navigator.pushAndRemoveUntil( context, new MaterialPageRoute(builder: (context) => new TabBarPage()),(route) => route == null,);
    }
  }
  @override
  void dispose(){
    super.dispose();
    if(_timer != null){
      _timer.cancel();
    }
  }
}
