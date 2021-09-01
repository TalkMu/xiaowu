import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:xiaowu/entity/news_detail_entity.dart';
import 'package:xiaowu/service/service_method.dart';
import 'package:xiaowu/service/service_url.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class NewsDetail extends StatefulWidget {
  late int newsId;

  NewsDetail({required this.newsId});

  @override
  _NewsDetailState createState() => _NewsDetailState(this.newsId);
}

class _NewsDetailState extends State<NewsDetail> {

  var _futureBuilderFuture;

  int newsId;
  late NewsDetailEntity data;

  _NewsDetailState(this.newsId);


  @override
  void initState() {
    super.initState();
    _futureBuilderFuture = _getAPis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("实时热点详情", style: TextStyle(color: Colors.black, fontSize: 17)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Image.asset("assets/images/home/return.png",
                width: ScreenUtil.getInstance().getWidth(24),
                height: ScreenUtil.getInstance().getHeight(24)),
            onPressed: () => Navigator.pop(context)),
      ),
      body: FutureBuilder(
        future: _futureBuilderFuture,
        builder: _buildFuture,
      )
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        // 请求失败，显示错误
        return Text("Error: ${snapshot.error}");
      } else {
        // 请求成功，显示数据
        data = NewsDetailEntity().fromJson(snapshot.data["data"]);
        return _createView();
      }
    } else {
      // 请求未结束，显示loading
      return CircularProgressIndicator();
    }

  }

  Widget _createView(){
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16,top: 10),
      child: ListView(
        children: [
          Container(
            child: Text(
              data.title,
              style: TextStyle(
                  color: ColorUtil.fromHex("#161833"),
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("更新于"+data.createTimeStr,style: TextStyle(
                color: ColorUtil.fromHex("#94969E"),
                fontSize: 12,
                fontWeight: FontWeight.w400
            ),),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Html(
              data: data.content,
            ),
          )
        ],
      ),
    );
  }

  Future _getAPis() async{
    return await request(servicePath["newsDetail"],params: {"id":newsId},method:
    "GET",
        contentType:
    Headers.formUrlEncodedContentType);
  }
}
