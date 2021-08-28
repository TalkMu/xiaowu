import 'package:xiaowu/entity/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['imUserId'] != null) {
		data.imUserId = json['imUserId'].toString();
	}
	if (json['imUserPwd'] != null) {
		data.imUserPwd = json['imUserPwd'].toString();
	}
	if (json['loginPhone'] != null) {
		data.loginPhone = json['loginPhone'].toString();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName'].toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex'].toString();
	}
	if (json['staff'] != null) {
		data.staff = json['staff'];
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['avatar'] = entity.avatar;
	data['imUserId'] = entity.imUserId;
	data['imUserPwd'] = entity.imUserPwd;
	data['loginPhone'] = entity.loginPhone;
	data['nickName'] = entity.nickName;
	data['sex'] = entity.sex;
	data['staff'] = entity.staff;
	data['token'] = entity.token;
	data['userId'] = entity.userId;
	return data;
}