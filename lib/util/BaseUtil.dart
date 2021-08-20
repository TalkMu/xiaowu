import 'package:shared_preferences/shared_preferences.dart';

class BaseUtil{

  /// 获取token信息
  static Future<String> getToken() async{
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final _preferences = await preferences;
    String token = _preferences.getString("token")??'';
    return token;
  }

  /// 获取token信息
  static Future<bool> setToken(String token) async{
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final _preferences = await preferences;
    return _preferences.setString("token", token);
  }

  /// 检测是否登录
  static Future<bool> checkLogin() async{
    String token = await getToken();
    if(token == ''){
      return false;
    }
    return true;
  }
}