
import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';
import 'package:xiaowu/common/WeatherEnum.dart';
import 'package:xiaowu/model/WeatherModel.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  WeatherEnum weatherEnum = WeatherEnum.rain;
  String bigWeatherIcon = "assets/images/weather/fog.png";
  String curBackGround = "assets/images/bg/fog.png";
  Map<String, Object>? _loationResult;
  BaiduLocation? _baiduLocation; // 定位结果
  StreamSubscription<Map<String, Object>>? _locationListener;
  LocationFlutterPlugin _locationPlugin = new LocationFlutterPlugin();
  @override
  void dispose() {
    super.dispose();
    if (null != _locationListener) {
      _locationListener!.cancel(); // 停止定位
    }
  }

  /// 设置android端和ios端定位参数
  void _setLocOption() {
    /// android 端设置定位参数
    BaiduLocationAndroidOption androidOption = new BaiduLocationAndroidOption();
    androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
    androidOption.setIsNeedAltitude(true); // 设置是否需要返回海拔高度信息
    androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
    androidOption.setIsNeedLocationPoiList(true); // 设置是否需要返回周边poi信息
    androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
    androidOption.setOpenGps(true); // 设置是否需要使用gps
    androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
    androidOption.setScanspan(1000); // 设置发起定位请求时间间隔

    Map androidMap = androidOption.getMap();

    /// ios 端设置定位参数
    BaiduLocationIOSOption iosOption = new BaiduLocationIOSOption();
    iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    iosOption.setBMKLocationCoordinateType("BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
    iosOption.setLocationTimeout(10); // 设置位置获取超时时间
    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest");  // 设置预期精度参数
    iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
    iosOption.setDistanceFilter(100); // 设置定位最小更新距离
    iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
    iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

    Map iosMap = iosOption.getMap();

    _locationPlugin.prepareLoc(androidMap, iosMap);
  }

  /// 启动定位
  void _startLocation() {
    if (null != _locationPlugin) {
      _setLocOption();
      _locationPlugin.startLocation();
    }
  }

  /// 停止定位
  void _stopLocation() {
    if (null != _locationPlugin) {
      _locationPlugin.stopLocation();
    }
  }

  @override
  void initState() {

    super.initState();
    _locationPlugin.requestPermission();

    _locationListener = _locationPlugin
        .onResultCallback()
        .listen((Map<String, Object> result) {
      setState(() {
        _loationResult = result;
        try {
          _baiduLocation = BaiduLocation.fromMap(result); // 将原生端返回的定位结果信息存储在定位结果类中
          print(_baiduLocation!.longitude);
          print(_baiduLocation!.city);
          print(_baiduLocation!.address);
        } catch (e) {
          print(e);
        }
      });
    });

    _startLocation();
  }

  @override
  Widget build(BuildContext context) {
    var weatherLabelSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(bigWeatherIcon,
                            width: ScreenUtil.getInstance().getWidth(44),
                            height: ScreenUtil.getInstance().getWidth(44)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().getAdapterSize(8)),
                        child: Text(
                          "35°c",
                          style: TextStyle(
                              fontSize:
                                  ScreenUtil.getInstance().getAdapterSize(32),
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().getAdapterSize(8)),
                        child: Text(
                          "晴/pm 2.5",
                          style: TextStyle(
                            fontSize:
                                ScreenUtil.getInstance().getAdapterSize(18),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      left: ScreenUtil.getInstance().getWidth(7)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(6)),
                  child: Text(
                    "6月29日 农历三月初八 星期三",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getSp(14),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().getWidth(62),
                top: ScreenUtil.getInstance().getHeight(17)),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "武侯区",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().getAdapterSize(16),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(5)),
                  child: Image.asset(
                    "assets/images/home/location.png",
                    width: ScreenUtil.getInstance().getWidth(18),
                    height: ScreenUtil.getInstance().getWidth(18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    var weatherTabSection = Container(
        child: GridView.count(
      crossAxisCount: 5,
      childAspectRatio: 1.0,
      mainAxisSpacing: ScreenUtil.getInstance().getWidth(27),
      shrinkWrap: true,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/weather/sunny.png",
                  width: ScreenUtil.getInstance().getWidth(24),
                  height: ScreenUtil.getInstance().getHeight(24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().getAdapterSize(7)),
                child: Text(
                  "星期五",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/weather/sunny.png",
                  width: ScreenUtil.getInstance().getWidth(24),
                  height: ScreenUtil.getInstance().getHeight(24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().getAdapterSize(7)),
                child: Text(
                  "星期五",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/weather/sunny.png",
                  width: ScreenUtil.getInstance().getWidth(24),
                  height: ScreenUtil.getInstance().getHeight(24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().getAdapterSize(7)),
                child: Text(
                  "星期五",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/weather/sunny.png",
                  width: ScreenUtil.getInstance().getWidth(24),
                  height: ScreenUtil.getInstance().getHeight(24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().getAdapterSize(7)),
                child: Text(
                  "星期五",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/weather/sunny.png",
                  width: ScreenUtil.getInstance().getWidth(24),
                  height: ScreenUtil.getInstance().getHeight(24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().getAdapterSize(7)),
                child: Text(
                  "星期五",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ],
    ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // 装饰图片/背景图片
          image: new DecorationImage(
              // 图片填充方式
              fit: BoxFit.cover,
              // 图片位置
              alignment: Alignment.topCenter,
              image: AssetImage(curBackGround),
              // 图片平铺方式
              repeat: ImageRepeat.repeatY),
        ),
        child: Container(
            alignment: Alignment.center,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    SizedBox(
                      height: ScreenUtil.getInstance().getAdapterSize(54),
                    ),
                    //WeatherSection(null);
                  ],
                ))),
      ),
    );
  }

  String getWeatherUrl(WeatherEnum weatherEnum) {
    String name = "";
    switch (weatherEnum) {
      case WeatherEnum.overcast:
        name = "overcast.png";
        break;
      case WeatherEnum.snow:
        name = "snow.png";
        break;
      case WeatherEnum.rain:
        name = "rain.png";
        break;
      case WeatherEnum.sunny:
        name = "sunny.png";
        break;
      case WeatherEnum.cloudy:
        name = "cloudy.png";
        break;
      case WeatherEnum.fog:
        name = "fog.png";
        break;
    }
    return name;
  }
}

class WeatherSection extends StatefulWidget {
  HomeWeather data;

  WeatherSection(this.data);

  @override
  State createState() {
    return new _WeatherSectionState(this.data);
  }
}

class _WeatherSectionState extends State<WeatherSection> {
  HomeWeather data;

  _WeatherSectionState(this.data);

  String bigWeatherIcon = "assets/images/weather/big_";
  String curBackGround = "assets/images/bg/";

  @override
  Widget build(BuildContext context) {
    Widget weatherLabelSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(bigWeatherIcon,
                            width: ScreenUtil.getInstance().getWidth(44),
                            height:
                            ScreenUtil.getInstance().getWidth(44)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance()
                                .getAdapterSize(8)),
                        child: Text(
                          "35°c",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance()
                                  .getAdapterSize(32),
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance()
                                .getAdapterSize(8)),
                        child: Text(
                          "晴/pm 2.5",
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance()
                                .getAdapterSize(18),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      left: ScreenUtil.getInstance().getWidth(7)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(6)),
                  child: Text(
                    "6月29日 农历三月初八 星期三",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getSp(14),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().getWidth(62),
                top: ScreenUtil.getInstance().getHeight(17)),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "武侯区",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                        ScreenUtil.getInstance().getAdapterSize(16),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(5)),
                  child: Image.asset(
                    "assets/images/home/location.png",
                    width: ScreenUtil.getInstance().getWidth(18),
                    height: ScreenUtil.getInstance().getWidth(18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    Widget weatherTabSection = Container(
        child: GridView.count(
          crossAxisCount: 5,
          childAspectRatio: 1.0,
          mainAxisSpacing: ScreenUtil.getInstance().getWidth(27),
          shrinkWrap: true,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/weather/sunny.png",
                      width: ScreenUtil.getInstance().getWidth(24),
                      height: ScreenUtil.getInstance().getHeight(24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getAdapterSize(7)),
                    child: Text(
                      "星期五",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil.getInstance().getAdapterSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/weather/sunny.png",
                      width: ScreenUtil.getInstance().getWidth(24),
                      height: ScreenUtil.getInstance().getHeight(24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getAdapterSize(7)),
                    child: Text(
                      "星期五",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil.getInstance().getAdapterSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/weather/sunny.png",
                      width: ScreenUtil.getInstance().getWidth(24),
                      height: ScreenUtil.getInstance().getHeight(24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getAdapterSize(7)),
                    child: Text(
                      "星期五",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil.getInstance().getAdapterSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/weather/sunny.png",
                      width: ScreenUtil.getInstance().getWidth(24),
                      height: ScreenUtil.getInstance().getHeight(24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getAdapterSize(7)),
                    child: Text(
                      "星期五",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil.getInstance().getAdapterSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/weather/sunny.png",
                      width: ScreenUtil.getInstance().getWidth(24),
                      height: ScreenUtil.getInstance().getHeight(24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getAdapterSize(7)),
                    child: Text(
                      "星期五",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil.getInstance().getAdapterSize(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
    return Container(
      child: Column(
        children: [
          weatherLabelSection,
          SizedBox(
            height: ScreenUtil.getInstance().getAdapterSize(16),
          ),
          weatherTabSection
        ],
      ),
    );
  }
}
