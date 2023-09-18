class AllUserModel {
  final String name;
  final int id;
  final String email;
  final dynamic phone;
  late final String userType;
  final String userStatus;
  AllUserModel(
      {required this.name,
        required this.userStatus,
        required this.id,
      required this.email,
      required this.phone,
      required this.userType});
  factory AllUserModel.fromJson(Map<String, dynamic> json) {
    return AllUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userType: json['user_type'],
      userStatus: json['user_status']??'0'
    );
  }
}
