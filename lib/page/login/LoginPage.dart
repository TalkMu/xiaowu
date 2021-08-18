import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaowu/page/login/CheckPage.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController();

  // 按钮是否启用
  bool btnEnable = false;
  // 按钮透明度
  double btnOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750,height:1334)..init(context);

    Widget logoSection = Container(
      child: Image.asset(
        "assets/images/login/logo.png",
        width: 130,
        height: 130,
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
                  fontSize: 24, color: ColorUtil.fromHex('#FF161833')),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "未注册手机可输入验证码完成注册",
              style: TextStyle(
                  fontSize: 14, color: ColorUtil.fromHex('#FF94969E')),
            ),
          ),
        ],
      ),
    );

    Widget phoneSection = Container(

      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "请输入手机号码",
          hintStyle: TextStyle(
            color: ColorUtil.fromHex("#FF94969E"),
          ),
          prefixIcon: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    "+86",
                    style: TextStyle(
                        color: ColorUtil.fromHex("#161833"), fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2,right: 2),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: ColorUtil.fromHex("#94969E"),
                  ),
                )
              ],
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
              setState(() {
                this.btnEnable = false;
                this.btnOpacity = 0.5;
              });
            },
            child: Image.asset("assets/images/login/cha.png"),
          ),
        ),
        autofocus: false,
        onChanged: (val){
          setState(() {
            if(this.checkPhone()){
              this.btnEnable = true;
              this.btnOpacity = 1.0;
            }else{
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
        margin: EdgeInsets.only(top: 39),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorUtil.fromHex("#F76600"),
                ColorUtil.fromHex("#FCA000")
              ],
            ),
            borderRadius: BorderRadius.circular(24.5)),
        child: TextButton(
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
                    width: 50,
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
                    width: 50,
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
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        body:GestureDetector(
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
                margin: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                child: new ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    new SizedBox(height: ScreenUtil().setHeight(96),),
                    logoSection,
                    new SizedBox(height: ScreenUtil().setHeight(30),),
                    labelSection,
                    new SizedBox(height: ScreenUtil().setHeight(45),),
                    phoneSection,
                    new SizedBox(height: ScreenUtil().setHeight(40),),
                    btnSection,
                    new SizedBox(height: ScreenUtil().setHeight(380),),
                    weiXinSection,
                  ],
                )),
              )
        )
    );
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
    print("获取验证码");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>new CheckPage()));
  }

  bool weiXinLogin() {
    print("点击微信登录");
    return true;
  }
}
