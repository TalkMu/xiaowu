class ForecastWeather {
  // 图标
  String icon;

  // 当前温度
  int curTem;

  // 星期
  String week;

  // 天气
  String weather;

  ForecastWeather({required this.icon, required this.curTem, required this.week, required this.weather});
}

class RealTimeWeather {
  // 图标
  String icon;

  //区
  String area;

  // 背景
  String bgIcon;

  // 当前温度
  int curTem;

  // 星期
  String week;

  // 阳历
  String solarCalendar;

  // 农历
  String lunarCalendar;

  // PM2.5
  int airPM25;

  // 天气
  String weather;

  RealTimeWeather(
      {required this.icon,
      required this.bgIcon,
      required this.curTem,
      required this.area,
      required this.week,
      required this.solarCalendar,
      required this.lunarCalendar,
      required this.airPM25,
      required this.weather});
}

class HomeWeather {
  // 实时天气
  RealTimeWeather lives;

  // 预报天气
  List<ForecastWeather> forecasts;

  HomeWeather({required this.lives, required this.forecasts});

  factory HomeWeather.create(){
    return HomeWeather(
        lives: RealTimeWeather(
        icon: "assets/images/weather/big_sunny.png",
        bgIcon: "assets/images/bg/sunny.png",
        area: "成都市",
        curTem: 35,
        week: "星期五",
        solarCalendar: "1月1日",
        lunarCalendar: "大年初一",
        airPM25: 25,
        weather: "晴"), forecasts: List.of([
      ForecastWeather(
          icon: "assets/images/weather/sunny.png",
          curTem: 0,
          week: "星期一",
          weather: "晴"),
      ForecastWeather(
          icon: "assets/images/weather/sunny.png",
          curTem: 0,
          week: "星期一",
          weather: "晴"),
      ForecastWeather(
          icon: "assets/images/weather/sunny.png",
          curTem: 0,
          week: "星期一",
          weather: "晴"),
      ForecastWeather(
          icon: "assets/images/weather/sunny.png",
          curTem: 0,
          week: "星期一",
          weather: "晴"),
      ForecastWeather(
          icon: "assets/images/weather/sunny.png",
          curTem: 0,
          week: "星期一",
          weather: "晴"),
    ]));
  }
}
