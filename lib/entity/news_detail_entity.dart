import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class NewsDetailEntity with JsonConvert<NewsDetailEntity> {
	late int id;
	late String title;
	late String content;
	late String createTimeStr;
	late String createTime;
}
