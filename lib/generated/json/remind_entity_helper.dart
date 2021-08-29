import 'package:xiaowu/entity/remind_entity.dart';

remindEntityFromJson(RemindEntity data, Map<String, dynamic> json) {
	if (json['remindType'] != null) {
		data.remindType = json['remindType'].toString();
	}
	if (json['remindContent'] != null) {
		data.remindContent = json['remindContent'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['remindInfoUrl'] != null) {
		data.remindInfoUrl = json['remindInfoUrl'].toString();
	}
	return data;
}

Map<String, dynamic> remindEntityToJson(RemindEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['remindType'] = entity.remindType;
	data['remindContent'] = entity.remindContent;
	data['url'] = entity.url;
	data['remindInfoUrl'] = entity.remindInfoUrl;
	return data;
}