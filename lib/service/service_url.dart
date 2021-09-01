import 'package:xiaowu/util/BaseUtil.dart';

const serviceUrl = 'http://xiaowudev.sdfykjyxgs.cn:8080/';

const headers = {
  "Accept": "*/*",
  "Accept-Encoding": "gzip, deflate",
  "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
  "Content-Length": "17",
  "Content-Type": "application/x-www-form-urlencoded",
  "Host": "xiaowudev.sdfykjyxgs.cn:8080",
  "Origin": serviceUrl,
  "Proxy-Connection": "keep-alive",
  "Request-Origion": "Knife4j",
  "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36",
};
const servicePath = {
  // 获取验证码
  "getVerificationCode": serviceUrl + "sendLoginVerificationCode",
  "verificationCodeLogin": serviceUrl + "verificationCodeLogin",
  "home": serviceUrl + "biz/index/home",
  "newsDetail": serviceUrl + "biz/news/appDetail",
};
