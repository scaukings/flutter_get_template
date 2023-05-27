
class ProfileModel {
  String? id;
  String? nickname;
  String? phone;
  String? avatar;

  ProfileModel({this.id, this.nickname, this.phone, this.avatar});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as String?,
        nickname: json['nickname'] as String?,
        phone: json['phone'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
        'phone': phone,
        'avatar': avatar,
      };
}
