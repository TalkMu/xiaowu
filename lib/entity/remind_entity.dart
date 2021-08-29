import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class RemindEntity with JsonConvert<RemindEntity> {
	late String remindType;
	late String remindContent;
	late String url;
	late String remindInfoUrl;
}
