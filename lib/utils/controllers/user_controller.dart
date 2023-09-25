import 'package:get/get.dart';

import '../models/user_model.dart';

class UsersController extends GetxController {
  final List<UserModel> users = <UserModel>[].obs;

  Future<void> addUser(UserModel user) async {
    users.add(user);
  }

  Future<void> removeUser(UserModel user) async {
    users.remove(user);
  }

  Future<UserModel?> getUserByUsername(String username) async {
    return users.firstWhereOrNull((user) => user.username == username);
  }
}
