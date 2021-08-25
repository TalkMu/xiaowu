import 'package:amap_location/amap_location.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/common/WeatherEnum.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String bgUrl = "";
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
    _initLocation();
    super.initState();
    bgUrl = getWeatherBg(WeatherEnum.snow);
    LogUtil.d("HomePage initState");
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.d("HomePage build");
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // 装饰图片/背景图片
          image: new DecorationImage(
              // 图片填充方式
              fit: BoxFit.cover,
              // 图片位置
              alignment: Alignment.topCenter,
              image: AssetImage(bgUrl),
              // 图片平铺方式
              repeat: ImageRepeat.repeatY),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_loc != null? (_loc!.latitude.toString() + "---" + _loc!.longitude.toString()):"btn"),
              Text(location != null? location.toString():"暂无")
            ],
          ),
        ),
      ),
    );
  }

  String getWeatherBg(WeatherEnum weatherEnum) {
    String name = "";
    switch (weatherEnum) {
      case WeatherEnum.overcast:
        name = "overcast";
        break;
      case WeatherEnum.snow:
        name = "snow";
        break;
      case WeatherEnum.rain:
        name = "rain";
        break;
      case WeatherEnum.sunny:
        name = "sunny";
        break;
      case WeatherEnum.cloudy:
        name = "cloudy";
        break;
      case WeatherEnum.fog:
        name = "fog";
        break;
    }
    return "assets/images/bg/" + name + ".png";
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
