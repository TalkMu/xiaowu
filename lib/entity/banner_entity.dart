import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
	late String name;
	late String url;
	dynamic jumpUrl;
}
