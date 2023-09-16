class LoginModel {
  final String message;
  final LoginData data;
  final bool status;
  final int code;

  LoginModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      data: LoginData.fromJson(json['data']),
      status: json['status'],
      code: json['code'],
    );
  }
}

class LoginData {
  final String token;
  final String username;
  final String email;
  final String userType;

  LoginData({
    required this.token,
    required this.username,
    required this.email,
    required this.userType,
  });
  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
      username: json['username'],
      email: json['email'],
      userType: json['user_type'],
    );
  }
}
