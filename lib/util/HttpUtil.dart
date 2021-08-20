import 'package:dio/dio.dart';

class HttpUtil{
  static String baseHost = "https://www.fastmock.site/mock/74fad4546268de89206d68fbf6240ddc/xiaowu";

  static String getBaseUrl(String url){
    return baseHost + url;
  }

  static void getCode(Map<String,Object> param, {success,error}) async{
    String url = getBaseUrl("/getCode");
    Response response = await Dio().get(url,queryParameters: param);
    success(response.data);
  }

  static void login(Map<String,Object> param, {success,error}) async{
    String url = getBaseUrl("/login");
    Response response = await Dio().get(url,queryParameters: param);
    success(response.data);
  }
}