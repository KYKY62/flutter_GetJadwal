import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.id,
    this.email,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  String? email;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        id: json["id"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "updatedAt": updatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
      };
}
