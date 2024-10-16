import 'dart:convert';

import 'package:my_app/features/auth/domain/entities/user_entity.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
    required id,
    required name,
    required lastname,
    required email,
    required password,
    required photoUrl,
    required createdAt,
    required updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'password': password,
        'photoUrl': photoUrl,
        'created_at': createAt,
        'updated_at': updatedAt,
      };
}
