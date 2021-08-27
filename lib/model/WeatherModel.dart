class WeatherModel{
  // 图标
  String icon;
  // 当前温度
  String curTem;
  // 星期
  String week;
  // 阳历
  String solarCalendar;
  // 农历
  String lunarCalendar;
  // PM2.5
  String airPM25;
  // 天气
  String weather;

  WeatherModel(this.icon, this.curTem, this.week, this.solarCalendar,
      this.lunarCalendar, this.airPM25, this.weather);
}

class HomeWeather{
  // 实时天气
  WeatherModel lives;
  // 预报天气
  List<WeatherModel> forecast;

  HomeWeather(this.lives, this.forecast);
}