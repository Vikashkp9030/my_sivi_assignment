import '../entities/user.dart';
import '../repositories/users_repository.dart';

class GetUsersUseCase {
  final UsersRepository repository;

  GetUsersUseCase(this.repository);

  List<User> call() {
    return repository.getUsers();
  }
}
