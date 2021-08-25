

import 'package:sp_util/sp_util.dart';
import 'package:xiaowu/common/Constants.dart';
import 'package:xiaowu/model/User.dart';

class BaseUtil{

  static User? getLoginUser(){
    var obj = SpUtil.getObject(Constants.LOGIN_DATA_KEY);
    if(obj == null){
      return null;
    }
    var user = User.fromJson(obj);
    return user;
  }

  static String getToken(){
    var user = getLoginUser();
    if(user == null){
      return "";
    }
    return user.token;
  }

  static bool checkLogin(){
    var user = getLoginUser();
    return (user != null);
  }
}