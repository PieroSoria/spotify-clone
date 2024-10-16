class UserEntity {
  int? id;
  String? name;
  String? lastname;
  String? email;
  String? password;
  String? photoUrl;
  DateTime? createAt;
  DateTime? updatedAt;

  UserEntity({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.photoUrl,
    this.createAt,
    this.updatedAt,
  });
}
