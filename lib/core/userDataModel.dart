class UserModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final int userType;
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.userType
  });
}