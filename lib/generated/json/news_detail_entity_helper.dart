import 'package:xiaowu/entity/news_detail_entity.dart';

newsDetailEntityFromJson(NewsDetailEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['createTimeStr'] != null) {
		data.createTimeStr = json['createTimeStr'].toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	return data;
}

Map<String, dynamic> newsDetailEntityToJson(NewsDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['createTimeStr'] = entity.createTimeStr;
	data['createTime'] = entity.createTime;
	return data;
}