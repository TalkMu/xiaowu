import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';

/// 公用请求方法
Future request(url, {params,data,method="POST",contentType=Headers.jsonContentType}) async{
  LogUtil.v("URL：$url Method:$method Params:$params Data:$data");
  Dio dio = new Dio();
  Options options = Options(
    contentType: contentType,
    method: method,
    sendTimeout: 5000,
  );
  Response response = await Dio().request(url,queryParameters: params,data: (contentType == Headers.formUrlEncodedContentType)?FormData.fromMap(data):data,options: options);
  if(response.statusCode == 200){
    var data = response.data;
    LogUtil.v("响应结果：$data");
    return data;
  }else{
    throw new Exception("服务器异常");
  }
}
