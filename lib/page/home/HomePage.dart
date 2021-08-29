import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:lunar_calendar/lunar_calendar.dart';
import 'package:xiaowu/entity/banner_entity.dart';
import 'package:xiaowu/entity/category_entity.dart';
import 'package:xiaowu/entity/weather_entity.dart';
import 'package:xiaowu/model/WeatherModel.dart';
import 'package:xiaowu/page/home/BannerSection.dart';
import 'package:xiaowu/page/login/LoginPage.dart';
import 'package:xiaowu/service/service_method.dart';
import 'package:xiaowu/service/service_url.dart';
import 'package:xiaowu/util/BaseUtil.dart';

import 'CategorySection.dart';
import 'WeatherSection.dart';

class HomePage extends StatefulWidget {
  HomeWeather data = HomeWeather.create();

  @override
  State createState() {
    print("createState");
    return new _HomePageState(data);
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  HomeWeather weather;
  dynamic homeData;
  var _futureBuilderFuture;

  _HomePageState(this.weather);

  String _districtValue = "110100";

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    print("initState");
    var location = BaseUtil.getLocation();
    if (location != null && location.address != null) {
      setState(() {
        _districtValue = location.address.split("=")[1].split("|")[0].trim();
      });
    }
    _getWeather();
    _futureBuilderFuture = _getAPis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            // 装饰图片/背景图片
            image: new DecorationImage(
                // 图片填充方式
                fit: BoxFit.cover,
                // 图片位置
                alignment: Alignment.topCenter,
                image: AssetImage(weather.lives.bgIcon),
                // 图片平铺方式
                repeat: ImageRepeat.repeatY),
          ),
          child: FutureBuilder(
            future: _futureBuilderFuture,
            builder: _buildFuture,
          )),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    // 请求已结束
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        // 请求失败，显示错误
        return Text("Error: ${snapshot.error}");
      } else {
        // 请求成功，显示数据
        homeData = snapshot.data["data"];
        return _createView();
      }
    } else {
      // 请求未结束，显示loading
      return CircularProgressIndicator();
    }
  }

  Widget _createView() {
    return Container(
        alignment: Alignment.center,
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              children: [
                SizedBox(
                  height: ScreenUtil.getInstance().getHeight(54),
                ),
                WeatherSection(weather),
                SizedBox(
                  height: ScreenUtil.getInstance().getHeight(20),
                ),
                CategorySection((homeData["serviceVOList"] as List)
                    .map((e) => CategoryEntity().fromJson(e))
                    .toList()),
                SizedBox(
                  height: ScreenUtil.getInstance().getHeight(12),
                ),
                BannerSection((homeData["banners"] as List).map((e) =>
                    BannerEntity().fromJson(e)).toList()),
                TextButton(
                    onPressed: () {
                      _getHomeData();
                    },
                    child: Text("获取天气"))
              ],
            )));
  }

  String _getWeatherUrl(String weather) {
    String name = "";
    if (weather.contains("阴")) {
      name = "overcast.png";
    } else if (weather.contains("雪")) {
      name = "snow.png";
    } else if (weather.contains("雨")) {
      name = "rain.png";
    } else if (weather.contains("晴")) {
      name = "sunny.png";
    } else if (weather.contains("多云")) {
      name = "cloudy.png";
    } else if (weather.contains("雾")) {
      name = "fog.png";
    } else {
      name = "cloudy.png";
    }
    return name;
  }

  Future _getWeather() async {
    // 构造检索参数
    BMFWeatherSearchOption weatherSearchOption = BMFWeatherSearchOption(
        districtID: _districtValue,
        serverType: BMFWeatherServerType.Default,
        dataType: BMFWeatherDataType.All,
        languageType: BMFLanguageType.Chinese);
    // 检索实例
    BMFWeatherSearch weatherSearch = BMFWeatherSearch();
    // 发起检索
    bool flag = await weatherSearch.weatherSearch(weatherSearchOption);
    // 检索回调
    weatherSearch.onGetWeatherSearchResult(callback:
        (BMFWeatherSearchResult result, BMFSearchErrorCode errorCode) {
      var bdWeather = WeatherEntity().fromJson(result.toMap());
      // 天气实况数据
      var realTimeWeather = bdWeather.realTimeWeather;
      var date = DateTime.now();
      List<int> lunarChinese = CalendarConverter.solarToLunar(
          date.year, date.month, date.day, Timezone.Chinese);
      setState(() {
        weather = HomeWeather(
            lives: new RealTimeWeather(
                curTem: realTimeWeather!.sensoryTemp,
                week: DateUtil.getWeekday(DateTime.now(), languageCode: "zh"),
                area: bdWeather.location!.districtName + "区",
                bgIcon: "assets/images/bg/" +
                    _getWeatherUrl(realTimeWeather.phenomenon),
                weather: realTimeWeather.phenomenon,
                icon: "assets/images/weather/big_" +
                    _getWeatherUrl(realTimeWeather.phenomenon),
                airPM25: 25,
                solarCalendar: DateUtil.formatDate(date, format: "MM月dd日"),
                lunarCalendar: "农历" +
                    lunarChinese[1].toString() +
                    "月" +
                    lunarChinese[0].toString()),
            forecasts: bdWeather.forecasts!
                .map((e) => ForecastWeather(
                    week: e.week,
                    curTem: e.lowestTemp,
                    weather: e.phenomenonDay,
                    icon: "assets/images/weather/" +
                        _getWeatherUrl(e.phenomenonDay)))
                .toList());
      });
    });
  }

  Future _getHomeData() async {
    return await request(servicePath["home"],method: "GET", contentType:
    Headers.formUrlEncodedContentType);
  }

  Future _getAPis(){
    return _getHomeData();
  }
}
