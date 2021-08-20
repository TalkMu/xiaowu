import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaowu/model/ApiResult.dart';
import 'package:xiaowu/page/login/CheckPage.dart';
import 'package:xiaowu/util/ColorUtil.dart';
import 'package:xiaowu/util/HttpUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController();
  FocusNode focusNode = FocusNode();

  // 按钮是否启用
  bool btnEnable = false;

  // 按钮透明度
  double btnOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 375, height: 812, allowFontScaling: true)
          ..init(context);
    Widget logoSection = Container(
      child: Image.asset(
        "assets/images/login/logo.png",
        width: ScreenUtil().setWidth(130),
        height: ScreenUtil().setWidth(130),
      ),
    );

    Widget labelSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "手机验证码登录",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: ColorUtil.fromHex('#FF161833')),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setSp(16)),
            child: Text(
              "未注册手机可输入验证码完成注册",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: ColorUtil.fromHex('#FF94969E')),
            ),
          ),
        ],
      ),
    );

    Widget phoneSection = Container(
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: "请输入手机号码",
          hintStyle: TextStyle(
            color: ColorUtil.fromHex("#FF94969E"),
          ),
          prefixIcon: GestureDetector(
            onTap: () {
              if (!focusNode.hasFocus) {
                setState(() {
                  focusNode.canRequestFocus = false;
                });
              }
            },
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                      "+86",
                      style: TextStyle(
                          color: ColorUtil.fromHex("#161833"),
                          fontSize: ScreenUtil().setSp(16)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    child: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: ColorUtil.fromHex("#94969E"),
                    ),
                  )
                ],
              ),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorUtil.fromHex("#DDDEDD")),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtil.fromHex("#DDDEDD"))),
          suffixIcon: GestureDetector(
            onTap: () {
              this.phoneController.clear();
              if (!focusNode.hasFocus) {
                focusNode.canRequestFocus = false;
              }
              setState(() {
                this.btnEnable = false;
                this.btnOpacity = 0.5;
              });
            },
            child: Image.asset("assets/images/login/cha.png"),
          ),
        ),
        autofocus: false,
        onChanged: (val) {
          setState(() {
            if (this.checkPhone()) {
              this.btnEnable = true;
              this.btnOpacity = 1.0;
            } else {
              this.btnEnable = false;
              this.btnOpacity = 0.5;
            }
          });
        },
      ),
    );

    Widget btnSection = Opacity(
      opacity: btnOpacity,
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
            '获取验证码',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () =>
              btnEnable == true ? this.getVerificationCode() : null,
        ),
      ),
    );

    Widget weiXinSection = Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorUtil.fromHex("#FFFFFF"),
                        ColorUtil.fromHex("#94969E")
                      ],
                    ),
                  ),
                  child: Container(
                    width: ScreenUtil().setWidth(50),
                    height: 1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "使用第三方登录",
                    style: TextStyle(
                        color: ColorUtil.fromHex("#93959B"), fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorUtil.fromHex("#94969E"),
                        ColorUtil.fromHex("#FFFFFF")
                      ],
                    ),
                  ),
                  child: Container(
                    width: ScreenUtil().setWidth(50),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                this.weiXinLogin();
              },
              child: Image.asset(
                "assets/images/login/weixin.png",
                width: ScreenUtil().setWidth(32),
                height: ScreenUtil().setHeight(32),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        //可以通过设置 这个属性 防止键盘 覆盖内容 或者 键盘 撑起内容
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/login/bg.png"),
                ),
              ),
              child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 0, horizontal: ScreenUtil().setWidth(30)),
                  child: new ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(96),
                      ),
                      logoSection,
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      labelSection,
                      SizedBox(
                        height: ScreenUtil().setHeight(45),
                      ),
                      phoneSection,
                      SizedBox(
                        height: ScreenUtil().setHeight(39),
                      ),
                      btnSection,
                      SizedBox(
                        height: ScreenUtil().setHeight(100),
                      ),
                      weiXinSection,
                    ],
                  )),
            )));
  }

  /// 校验电话号码是否通过
  bool checkPhone() {
    var phone = this.phoneController.text;
    if (phone.isEmpty) {
      return false;
    }
    if (phone.length != 11) {
      return false;
    }
    return true;
  }

  void getVerificationCode() {
    HttpUtil.getCode({"phone":this.phoneController.text},success: (data){
      if(data["code"] == 200){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new CheckPage();
        }));
      }else{
        print("获取验证码失败");
      }
    },);
  }

  bool weiXinLogin() {
    print("点击微信登录");
    return true;
  }
}
