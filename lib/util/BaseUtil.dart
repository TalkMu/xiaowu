

import 'package:flustars/flustars.dart';
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
import 'package:sp_util/sp_util.dart';
import 'package:xiaowu/common/Constants.dart';
import 'package:xiaowu/entity/user_entity.dart';

class BaseUtil{

  static UserEntity? getLoginUser(){
    var obj = SpUtil.getObj(Constants.LOGIN_DATA_KEY,(v)=>UserEntity().fromJson(v));
    return obj;
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

  static BaiduLocation? getLocation(){
    BaiduLocation? baiduLocation = SpUtil.getObj(Constants.CUR_LOCATION, (v) => BaiduLocation.fromMap(v));
    return baiduLocation;
  }
}