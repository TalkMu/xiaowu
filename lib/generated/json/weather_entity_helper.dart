import 'package:xiaowu/entity/weather_entity.dart';

weatherEntityFromJson(WeatherEntity data, Map<String, dynamic> json) {
	if (json['realTimeWeather'] != null) {
		data.realTimeWeather = WeatherRealTimeWeather().fromJson(json['realTimeWeather']);
	}
	if (json['location'] != null) {
		data.location = WeatherLocation().fromJson(json['location']);
	}
	if (json['forecasts'] != null) {
		data.forecasts = (json['forecasts'] as List).map((v) => WeatherForecasts().fromJson(v)).toList();
	}
	if (json['forecastHours'] != null) {
		data.forecastHours = json['forecastHours'];
	}
	if (json['lifeIndexes'] != null) {
		data.lifeIndexes = json['lifeIndexes'];
	}
	if (json['weatherAlerts'] != null) {
		data.weatherAlerts = json['weatherAlerts'];
	}
	return data;
}

Map<String, dynamic> weatherEntityToJson(WeatherEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['realTimeWeather'] = entity.realTimeWeather?.toJson();
	data['location'] = entity.location?.toJson();
	data['forecasts'] =  entity.forecasts?.map((v) => v.toJson())?.toList();
	data['forecastHours'] = entity.forecastHours;
	data['lifeIndexes'] = entity.lifeIndexes;
	data['weatherAlerts'] = entity.weatherAlerts;
	return data;
}

weatherRealTimeWeatherFromJson(WeatherRealTimeWeather data, Map<String, dynamic> json) {
	if (json['relativeHumidity'] != null) {
		data.relativeHumidity = json['relativeHumidity'] is String
				? int.tryParse(json['relativeHumidity'])
				: json['relativeHumidity'].toInt();
	}
	if (json['sensoryTemp'] != null) {
		data.sensoryTemp = json['sensoryTemp'] is String
				? int.tryParse(json['sensoryTemp'])
				: json['sensoryTemp'].toInt();
	}
	if (json['phenomenon'] != null) {
		data.phenomenon = json['phenomenon'].toString();
	}
	if (json['windDirection'] != null) {
		data.windDirection = json['windDirection'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['temperature'] != null) {
		data.temperature = json['temperature'] is String
				? int.tryParse(json['temperature'])
				: json['temperature'].toInt();
	}
	if (json['windPower'] != null) {
		data.windPower = json['windPower'].toString();
	}
	if (json['clouds'] != null) {
		data.clouds = json['clouds'] is String
				? int.tryParse(json['clouds'])
				: json['clouds'].toInt();
	}
	if (json['hourlyPrecipitation'] != null) {
		data.hourlyPrecipitation = json['hourlyPrecipitation'] is String
				? double.tryParse(json['hourlyPrecipitation'])
				: json['hourlyPrecipitation'].toDouble();
	}
	if (json['visibility'] != null) {
		data.visibility = json['visibility'] is String
				? int.tryParse(json['visibility'])
				: json['visibility'].toInt();
	}
	if (json['O3'] != null) {
		data.o3 = json['O3'] is String
				? int.tryParse(json['O3'])
				: json['O3'].toInt();
	}
	if (json['PM2_5'] != null) {
		data.pm25 = json['PM2_5'] is String
				? int.tryParse(json['PM2_5'])
				: json['PM2_5'].toInt();
	}
	if (json['NO2'] != null) {
		data.nO2 = json['NO2'] is String
				? int.tryParse(json['NO2'])
				: json['NO2'].toInt();
	}
	if (json['SO2'] != null) {
		data.sO2 = json['SO2'] is String
				? int.tryParse(json['SO2'])
				: json['SO2'].toInt();
	}
	if (json['airQualityIndex'] != null) {
		data.airQualityIndex = json['airQualityIndex'] is String
				? int.tryParse(json['airQualityIndex'])
				: json['airQualityIndex'].toInt();
	}
	if (json['PM10'] != null) {
		data.pM10 = json['PM10'] is String
				? int.tryParse(json['PM10'])
				: json['PM10'].toInt();
	}
	if (json['CO'] != null) {
		data.cO = json['CO'] is String
				? double.tryParse(json['CO'])
				: json['CO'].toDouble();
	}
	return data;
}

Map<String, dynamic> weatherRealTimeWeatherToJson(WeatherRealTimeWeather entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['relativeHumidity'] = entity.relativeHumidity;
	data['sensoryTemp'] = entity.sensoryTemp;
	data['phenomenon'] = entity.phenomenon;
	data['windDirection'] = entity.windDirection;
	data['updateTime'] = entity.updateTime;
	data['temperature'] = entity.temperature;
	data['windPower'] = entity.windPower;
	data['clouds'] = entity.clouds;
	data['hourlyPrecipitation'] = entity.hourlyPrecipitation;
	data['visibility'] = entity.visibility;
	data['O3'] = entity.o3;
	data['PM2_5'] = entity.pm25;
	data['NO2'] = entity.nO2;
	data['SO2'] = entity.sO2;
	data['airQualityIndex'] = entity.airQualityIndex;
	data['PM10'] = entity.pM10;
	data['CO'] = entity.cO;
	return data;
}

weatherLocationFromJson(WeatherLocation data, Map<String, dynamic> json) {
	if (json['country'] != null) {
		data.country = json['country'].toString();
	}
	if (json['province'] != null) {
		data.province = json['province'].toString();
	}
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['districtName'] != null) {
		data.districtName = json['districtName'].toString();
	}
	if (json['districtID'] != null) {
		data.districtID = json['districtID'].toString();
	}
	return data;
}

Map<String, dynamic> weatherLocationToJson(WeatherLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['country'] = entity.country;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['districtName'] = entity.districtName;
	data['districtID'] = entity.districtID;
	return data;
}

weatherForecastsFromJson(WeatherForecasts data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = json['date'].toString();
	}
	if (json['week'] != null) {
		data.week = json['week'].toString();
	}
	if (json['lowestTemp'] != null) {
		data.lowestTemp = json['lowestTemp'] is String
				? int.tryParse(json['lowestTemp'])
				: json['lowestTemp'].toInt();
	}
	if (json['highestTemp'] != null) {
		data.highestTemp = json['highestTemp'];
	}
	if (json['windPowerDay'] != null) {
		data.windPowerDay = json['windPowerDay'].toString();
	}
	if (json['windPowerNight'] != null) {
		data.windPowerNight = json['windPowerNight'].toString();
	}
	if (json['windDirectionDay'] != null) {
		data.windDirectionDay = json['windDirectionDay'].toString();
	}
	if (json['windDirectionrNight'] != null) {
		data.windDirectionrNight = json['windDirectionrNight'].toString();
	}
	if (json['phenomenonDay'] != null) {
		data.phenomenonDay = json['phenomenonDay'].toString();
	}
	if (json['phenomenonNight'] != null) {
		data.phenomenonNight = json['phenomenonNight'].toString();
	}
	if (json['airQualityIndex'] != null) {
		data.airQualityIndex = json['airQualityIndex'] is String
				? int.tryParse(json['airQualityIndex'])
				: json['airQualityIndex'].toInt();
	}
	return data;
}

Map<String, dynamic> weatherForecastsToJson(WeatherForecasts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['date'] = entity.date;
	data['week'] = entity.week;
	data['lowestTemp'] = entity.lowestTemp;
	data['highestTemp'] = entity.highestTemp;
	data['windPowerDay'] = entity.windPowerDay;
	data['windPowerNight'] = entity.windPowerNight;
	data['windDirectionDay'] = entity.windDirectionDay;
	data['windDirectionrNight'] = entity.windDirectionrNight;
	data['phenomenonDay'] = entity.phenomenonDay;
	data['phenomenonNight'] = entity.phenomenonNight;
	data['airQualityIndex'] = entity.airQualityIndex;
	return data;
}