import '../entities/user.dart';

abstract class UsersRepository {
  List<User> getUsers();
  Future<void> addUser(User user);
}
