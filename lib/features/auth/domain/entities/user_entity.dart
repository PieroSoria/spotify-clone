class UserEntity {
  int? id;
  String? name;
  String? lastname;
  String? email;
  String? password;
  String? photoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
  });
}
