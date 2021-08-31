import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class NewsEntity with JsonConvert<NewsEntity> {
	late int id;
	late String title;
	late List<String> mediaUrls;
	late String createTimeStr;
}
