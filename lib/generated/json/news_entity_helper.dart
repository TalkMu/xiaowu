import 'package:xiaowu/entity/news_entity.dart';

newsEntityFromJson(NewsEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['mediaUrls'] != null) {
		data.mediaUrls = (json['mediaUrls'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['createTimeStr'] != null) {
		data.createTimeStr = json['createTimeStr'].toString();
	}
	return data;
}

Map<String, dynamic> newsEntityToJson(NewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['mediaUrls'] = entity.mediaUrls;
	data['createTimeStr'] = entity.createTimeStr;
	return data;
}