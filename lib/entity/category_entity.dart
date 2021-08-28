import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
	late String serverName;
	late String serverIcon;
	late String serverType;
	CategoryServerItemInfo? serverItemInfo;
}

class CategoryServerItemInfo with JsonConvert<CategoryServerItemInfo> {
	late String bannerImg;
	List<CategoryServerItemInfoServerItemInfoVideoList>? serverItemInfoVideoList;
	List<CategoryServerItemInfoServerItemInfoImageCardList>? serverItemInfoImageCardList;
}

class CategoryServerItemInfoServerItemInfoVideoList with JsonConvert<CategoryServerItemInfoServerItemInfoVideoList> {
	late String content;
	late String payUrl;
}

class CategoryServerItemInfoServerItemInfoImageCardList with JsonConvert<CategoryServerItemInfoServerItemInfoImageCardList> {
	late String imgUrl;
}
