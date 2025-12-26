import 'package:hive/hive.dart';

import '../models/user_model.dart';

abstract class UsersLocalDataSource {
  List<UserModel> getUsers();
  Future<void> addUser(UserModel user);
}

class UsersLocalDataSourceImpl implements UsersLocalDataSource {
  final Box<String> box;

  UsersLocalDataSourceImpl(this.box);

  @override
  List<UserModel> getUsers() {
    return box.values.map((e) => UserModel.fromJsonString(e)).toList();
  }

  @override
  Future<void> addUser(UserModel user) async {
    await box.put(user.userId, user.toJsonString());
  }
}
