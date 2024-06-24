class UserModel {
  bool? isLogin;
  String? name;
  int? id;
  String? email;
  String? phone;
  String? authToken;

  UserModel({
    this.isLogin,
    this.name,
    this.id,
    this.email,
    this.phone,
    this.authToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      isLogin: json['isLogin'] as bool?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      authToken: json['authToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isLogin': isLogin,
      'name': name,
      'id': id,
      'email': email,
      'phone': phone,
      'authToken': authToken,
    };
  }
}
