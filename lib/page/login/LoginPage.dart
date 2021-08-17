import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: GestureDetector(
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
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 96),
                        child: Image.asset(
                          "assets/images/login/logo.png",
                          width: 130,
                          height: 130,
                        ),
                      ),
                      Container(
                        alignment: Alignment(-1, 0),
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          "手机验证码登录",
                          style: TextStyle(
                              fontSize: 24, color: ColorUtil.fromHex('#FF161833')),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-1, 0),
                        margin: EdgeInsets.only(top: 16),
                        child: Text(
                          "未注册手机可输入验证码完成注册",
                          style: TextStyle(
                              fontSize: 14, color: ColorUtil.fromHex('#FF94969E')),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 34),
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
                                          color: ColorUtil.fromHex("#161833"),
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 9),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: ColorUtil.fromHex("#94969E"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: ColorUtil.fromHex("#DDDEDD")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorUtil.fromHex("#DDDEDD"))),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                this.phoneController.clear();
                              },
                              child: Image.asset("assets/images/login/cha.png"),
                            ),
                          ),
                          autofocus: false,
                        ),
                      ),
                      Opacity(
                        opacity: this.checkPhone()?1:0.5,
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
                            onPressed: ()=>this.checkPhone()?this.getVerificationCode():null,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
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
                              child: Container(width: 50, height: 1,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("使用第三方登录",style: TextStyle(color: ColorUtil.fromHex("#93959B"),fontSize: 14),),
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
                              child: Container(width: 50, height: 1,),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: (){
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
                )),
          ),
        )
    );
  }

  /// 校验电话号码是否通过
  bool checkPhone(){
    var phone = this.phoneController.text;
    if(phone.isEmpty){
      return false;
    }
    if(phone.length != 11){
      return false;
    }
    return true;
  }

  bool getVerificationCode(){
    print("获取验证码");
    return true;
  }

  bool weiXinLogin(){
    print("点击微信登录");
    return true;
  }
}
