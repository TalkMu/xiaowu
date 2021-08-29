import 'package:xiaowu/entity/banner_entity.dart';

bannerEntityFromJson(BannerEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['jumpUrl'] != null) {
		data.jumpUrl = json['jumpUrl'];
	}
	return data;
}

Map<String, dynamic> bannerEntityToJson(BannerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['url'] = entity.url;
	data['jumpUrl'] = entity.jumpUrl;
	return data;
}