import 'package:xiaowu/entity/remind_entity.dart';

remindEntityFromJson(RemindEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['serviceType'] != null) {
		data.serviceType = json['serviceType'];
	}
	if (json['period'] != null) {
		data.period = json['period'].toString();
	}
	if (json['time'] != null) {
		data.time = json['time'].toString();
	}
	if (json['timestamp'] != null) {
		data.timestamp = json['timestamp'] is String
				? int.tryParse(json['timestamp'])
				: json['timestamp'].toInt();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	return data;
}

Map<String, dynamic> remindEntityToJson(RemindEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['serviceType'] = entity.serviceType;
	data['period'] = entity.period;
	data['time'] = entity.time;
	data['timestamp'] = entity.timestamp;
	data['description'] = entity.description;
	return data;
}