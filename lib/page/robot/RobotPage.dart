import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class RobotPage extends StatefulWidget {
  @override
  State createState() => RobotPageState();
}

class RobotPageState extends State<RobotPage> {
  double lineProgress = 0.0;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  _progressBar(double progress, BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.blueAccent.withOpacity(0),
        value: progress == 1.0 ? 0 : progress,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlue),
      ),
      height: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text("机器人", style: TextStyle(color: Colors.black, fontSize: 20)),
        elevation: 1,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(0.1),
        ),
      ),
      body: WebView(
        // 要显示的url
        initialUrl: "https://baidu.com",
        // JS执行模式 默认是不调用
        javascriptMode: JavascriptMode.unrestricted,
        // WebView创建完成时调用
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        // 加载进度
        onProgress: (progress) {
          setState(() {
            lineProgress = double.parse((progress/100).toString());
          });
        },
        // 拦截请求
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        // 页面开始加载
        onPageStarted: (String url) {},
        // 页面加载完成
        onPageFinished: (String url) {},
      ),
    );
  }
}
