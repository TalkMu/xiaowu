import 'package:xiaowu/entity/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
	if (json['serverName'] != null) {
		data.serverName = json['serverName'].toString();
	}
	if (json['serverIcon'] != null) {
		data.serverIcon = json['serverIcon'].toString();
	}
	if (json['serverType'] != null) {
		data.serverType = json['serverType'].toString();
	}
	if (json['serverItemInfo'] != null) {
		data.serverItemInfo = CategoryServerItemInfo().fromJson(json['serverItemInfo']);
	}
	return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['serverName'] = entity.serverName;
	data['serverIcon'] = entity.serverIcon;
	data['serverType'] = entity.serverType;
	data['serverItemInfo'] = entity.serverItemInfo?.toJson();
	return data;
}

categoryServerItemInfoFromJson(CategoryServerItemInfo data, Map<String, dynamic> json) {
	if (json['bannerImg'] != null) {
		data.bannerImg = json['bannerImg'].toString();
	}
	if (json['serverItemInfoVideoList'] != null) {
		data.serverItemInfoVideoList = (json['serverItemInfoVideoList'] as List).map((v) => CategoryServerItemInfoServerItemInfoVideoList().fromJson(v)).toList();
	}
	if (json['serverItemInfoImageCardList'] != null) {
		data.serverItemInfoImageCardList = (json['serverItemInfoImageCardList'] as List).map((v) => CategoryServerItemInfoServerItemInfoImageCardList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> categoryServerItemInfoToJson(CategoryServerItemInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bannerImg'] = entity.bannerImg;
	data['serverItemInfoVideoList'] =  entity.serverItemInfoVideoList?.map((v) => v.toJson())?.toList();
	data['serverItemInfoImageCardList'] =  entity.serverItemInfoImageCardList?.map((v) => v.toJson())?.toList();
	return data;
}

categoryServerItemInfoServerItemInfoVideoListFromJson(CategoryServerItemInfoServerItemInfoVideoList data, Map<String, dynamic> json) {
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['payUrl'] != null) {
		data.payUrl = json['payUrl'].toString();
	}
	return data;
}

Map<String, dynamic> categoryServerItemInfoServerItemInfoVideoListToJson(CategoryServerItemInfoServerItemInfoVideoList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['content'] = entity.content;
	data['payUrl'] = entity.payUrl;
	return data;
}

categoryServerItemInfoServerItemInfoImageCardListFromJson(CategoryServerItemInfoServerItemInfoImageCardList data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl'].toString();
	}
	return data;
}

Map<String, dynamic> categoryServerItemInfoServerItemInfoImageCardListToJson(CategoryServerItemInfoServerItemInfoImageCardList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	return data;
}