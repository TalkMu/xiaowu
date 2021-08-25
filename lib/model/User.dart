
class User{
  String token;
  String loginPhone;
  int userId;
  String nickName;
  String sex;
  String avatar;
  String imUserId;
  String imUserPwd;
  bool staff;

  User(this.token, this.loginPhone, this.userId, this.nickName, this.sex,
      this.avatar, this.imUserId, this.imUserPwd, this.staff);

  factory User.fromJson(dynamic json){
    return User(
        json["token"],
        json["loginPhone"],
        json["userId"],
        json["nickName"],
        json["sex"],
        json["avatar"],
        json["imUserId"],
        json["imUserPwd"],
        json["staff"]
    );
  }
}