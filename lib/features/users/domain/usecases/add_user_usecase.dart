import '../entities/user.dart';
import '../repositories/users_repository.dart';

class AddUserUseCase {
  final UsersRepository repository;

  AddUserUseCase(this.repository);

  Future<void> call(String name) {
    final user = User(
      userId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
    );

    return repository.addUser(user);
  }
}
