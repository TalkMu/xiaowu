import 'package:xiaowu/generated/json/base/json_convert_content.dart';
import 'package:xiaowu/generated/json/base/json_field.dart';

class WeatherEntity with JsonConvert<WeatherEntity> {
	WeatherRealTimeWeather? realTimeWeather;
	WeatherLocation? location;
	List<WeatherForecasts>? forecasts;
	dynamic forecastHours;
	dynamic lifeIndexes;
	dynamic weatherAlerts;
}

class WeatherRealTimeWeather with JsonConvert<WeatherRealTimeWeather> {
	late int relativeHumidity;
	late int sensoryTemp;
	late String phenomenon;
	late String windDirection;
	late String updateTime;
	late int temperature;
	late String windPower;
	late int clouds;
	late double hourlyPrecipitation;
	late int visibility;
	@JSONField(name: "O3")
	late int o3;
	@JSONField(name: "PM2_5")
	late int pm25;
	@JSONField(name: "NO2")
	late int nO2;
	@JSONField(name: "SO2")
	late int sO2;
	late int airQualityIndex;
	@JSONField(name: "PM10")
	late int pM10;
	@JSONField(name: "CO")
	late double cO;
}

class WeatherLocation with JsonConvert<WeatherLocation> {
	late String country;
	late String province;
	late String city;
	late String districtName;
	late String districtID;
}

class WeatherForecasts with JsonConvert<WeatherForecasts> {
	late String date;
	late String week;
	late int lowestTemp;
	late dynamic highestTemp;
	late String windPowerDay;
	late String windPowerNight;
	late String windDirectionDay;
	late String windDirectionrNight;
	late String phenomenonDay;
	late String phenomenonNight;
	late int airQualityIndex;
}
