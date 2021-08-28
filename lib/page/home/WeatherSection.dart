import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/model/WeatherModel.dart';

class WeatherSection extends StatelessWidget {
  HomeWeather data;

  WeatherSection(this.data);

  Widget createWeatherTab(ForecastWeather model) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              model.icon,
              width: ScreenUtil.getInstance().getWidth(24),
              height: ScreenUtil.getInstance().getHeight(24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().getHeight(7)),
            child: Text(
              model.week,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getSp(14),
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget weatherLabelSection = Container(
      width: ScreenUtil.getInstance().getWidth(317),
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
                        child: Image.asset(data.lives.icon,
                            width: ScreenUtil.getInstance().getWidth(44),
                            height: ScreenUtil.getInstance().getWidth(44)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().getWidth(8)),
                        child: Text(
                          data.lives.curTem.toString() + "°c",
                          style: TextStyle(
                              fontSize:
                              ScreenUtil.getInstance().getSp(32),
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().getWidth(8)),
                        child: Text(
                          data.lives.weather +
                              "/pm " +
                              data.lives.airPM25.toString(),
                          style: TextStyle(
                            fontSize:
                            ScreenUtil.getInstance().getSp(18),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(6)),
                  child: Text(
                    data.lives.solarCalendar +
                        " " +
                        data.lives.lunarCalendar +
                        " " +
                        data.lives.week,
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
          Expanded(
            child: Container(),
          ),
          Container(
            margin:
            EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(17)),
            child: Column(
              children: [
                Container(
                  child: Text(
                    data.lives.area,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().getSp(16),
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
        width: ScreenUtil.getInstance().getWidth(315),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          childAspectRatio: 1.0,
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          children: data.forecasts.map((e) => createWeatherTab(e)).toList(),
        ));

    return Container(
      child: Column(
        children: [
          weatherLabelSection,
          SizedBox(
            height: ScreenUtil.getInstance().getHeight(16),
          ),
          weatherTabSection
        ],
      ),
    );
  }
}