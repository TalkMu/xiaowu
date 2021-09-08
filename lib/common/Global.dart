import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';
import 'package:xiaowu/common/Constants.dart';

class Global {
  static BaiduLocation? _baiduLocation; // 定位结果
  static LocationFlutterPlugin _locationPlugin = new LocationFlutterPlugin();

  //初始化全局信息
  static Future init(VoidCallback callback) async {

    WidgetsFlutterBinding.ensureInitialized();
    //初始化设置 LogUtil
    LogUtil.init(isDebug: true);
    await SpUtil.getInstance();
    setDesignWHD(375, 812, density: 3);
    //configLoading();
    callback();
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
    }
    _locationPlugin.requestPermission();
    if(Platform.isIOS){
      LocationFlutterPlugin.setApiKey("ZePnrfC97Gvqn5OfH3KLONrtwkf7niAy");
      BMFMapSDK.setApiKeyAndCoordType("ZePnrfC97Gvqn5OfH3KLONrtwkf7niAy", BMF_COORD_TYPE.BD09LL);
    }
    _locationPlugin.onResultCallback().listen((Map<String, Object> result) {
          try {
            _baiduLocation =
                BaiduLocation.fromMap(result);
            print("定位位置成功："+json.encode(_baiduLocation!.getMap()));
            SpUtil.putObject(Constants.CUR_LOCATION, _baiduLocation!.getMap());
          } catch (e) {
            String msg = e.toString();
            LogUtil.e("定位异常：$msg");
          }
        });
    //_startLocation();
  }

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskType = EasyLoadingMaskType.black
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  /// 设置android端和ios端定位参数
  static void _setLocOption() {
    /// android 端设置定位参数
    BaiduLocationAndroidOption androidOption = new BaiduLocationAndroidOption();
    androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
    androidOption.setIsNeedAltitude(false); // 设置是否需要返回海拔高度信息
    androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
    androidOption.setIsNeedLocationPoiList(false); // 设置是否需要返回周边poi信息
    androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
    androidOption.setOpenGps(true); // 设置是否需要使用gps
    androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
    androidOption.setScanspan(1000); // 设置发起定位请求时间间隔

    Map androidMap = androidOption.getMap();

    /// ios 端设置定位参数
    BaiduLocationIOSOption iosOption = new BaiduLocationIOSOption();
    iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    iosOption.setBMKLocationCoordinateType(
        "BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
    iosOption.setLocationTimeout(10); // 设置位置获取超时时间
    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest"); // 设置预期精度参数
    iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
    iosOption.setDistanceFilter(100); // 设置定位最小更新距离
    iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
    iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

    Map iosMap = iosOption.getMap();

    _locationPlugin.prepareLoc(androidMap, iosMap);
  }

  /// 启动定位
  static void _startLocation() {
    _setLocOption();
    _locationPlugin.startLocation();
  }

  /// 停止定位
  static void _stopLocation() {
    _locationPlugin.stopLocation();
  }
}