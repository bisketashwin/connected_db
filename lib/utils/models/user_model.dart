import 'package:get/get.dart';

class UserModel extends GetxController {
  final String username;
  final String password;
  final String name;
  final String phoneNumber;

  UserModel({
    required this.username,
    required this.password,
    this.name = '',
    this.phoneNumber = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
