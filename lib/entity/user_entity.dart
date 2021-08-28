import 'package:xiaowu/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	late String avatar;
	late String imUserId;
	late String imUserPwd;
	late String loginPhone;
	late String nickName;
	late String sex;
	late bool staff;
	late String token;
	late int userId;
}
