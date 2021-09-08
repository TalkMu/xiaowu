import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class RemindEntity with JsonConvert<RemindEntity> {
	late int id;
	late String serviceType;
	late String period;
	late String time;
	late int timestamp;
	late String description;
}
