

import 'package:sp_util/sp_util.dart';

class BaseUtil{
  /// 检测是否登录
  static Future<bool> checkLogin() async{
    String token = getToken();
    if(token == ''){
      return false;
    }
    return true;
  }

  static void setToken(String token){
    SpUtil.putString("token", token);
  }

  static String getToken(){
    String token = SpUtil.getString("token",defValue: "")??"";
    return token;
  }
}