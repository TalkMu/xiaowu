import 'package:amap_location/amap_location.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String bigWeatherIcon = "assets/images/weather/big_";
  String curBackGround = "assets/images/bg/";
  String? location;
  AMapLocation? _loc;

  @override
  void dispose() {
    super.dispose();
    //这里可以停止定位
    AMapLocationClient.stopLocation();
    LogUtil.d("HomePage dispose");
  }

  @override
  void initState() {
    weatherEnum = WeatherEnum.cloudy;
    setState(() {
      bigWeatherIcon += getWeatherUrl(weatherEnum);
    });
    setState(() {
      curBackGround += getWeatherUrl(weatherEnum);
    });
    _initLocation();
    super.initState();

    LogUtil.d("HomePage initState");
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
                    weatherLabelSection,
                    SizedBox(
                      height: ScreenUtil.getInstance().getAdapterSize(16),
                    ),
                    weatherTabSection,
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

  //初始化定位监听，
  void _initLocation() async {
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));

    //监听坐标实时变换
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        _loc = loc;
        location = getLocationStr(loc);
      });
    });

    AMapLocationClient.startLocation();
  }

  String getLocationStr(AMapLocation loc) {
    if (loc == null) {
      return "正在定位";
    }

    if (loc.isSuccess()) {
      if (loc.hasAddress()) {
        return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
      } else {
        return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
      }
    } else {
      return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
    }
  }
}

class WeatherSection extends StatefulWidget {
  @override
  State createState() {
    return new _WeatherSectionState();
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
