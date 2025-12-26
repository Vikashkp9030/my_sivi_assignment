import '../../domain/entities/user.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_local_data_source.dart';
import '../models/user_model.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersLocalDataSource local;

  UsersRepositoryImpl(this.local);

  @override
  List<User> getUsers() {
    return local.getUsers().map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addUser(User user) async {
    await local.addUser(UserModel.fromEntity(user));
  }
}
