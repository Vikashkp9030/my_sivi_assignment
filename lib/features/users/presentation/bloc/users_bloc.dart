import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/add_user_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase getUsers;
  final AddUserUseCase addUser;

  UsersBloc({required this.getUsers, required this.addUser})
    : super(UsersInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<AddUserEvent>(_onAddUser);
  }

  /// 🔹 Load users
  Future<void> _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoading());

    try {
      final List<User> users = getUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError('Failed to load users'));
    }
  }

  /// 🔹 Add user
  Future<void> _onAddUser(AddUserEvent event, Emitter<UsersState> emit) async {
    try {
      await addUser(event.name);

      final List<User> users = getUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError('Failed to add user'));
    }
  }
}
