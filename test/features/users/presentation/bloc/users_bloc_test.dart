import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_sivi_assignment/features/users/domain/entities/user.dart';
import 'package:my_sivi_assignment/features/users/domain/usecases/add_user_usecase.dart';
import 'package:my_sivi_assignment/features/users/domain/usecases/get_users_usecase.dart';
import 'package:my_sivi_assignment/features/users/presentation/bloc/users_bloc.dart';
import 'package:my_sivi_assignment/features/users/presentation/bloc/users_event.dart';
import 'package:my_sivi_assignment/features/users/presentation/bloc/users_state.dart';

class MockGetUsers extends Mock implements GetUsersUseCase {}

class MockAddUser extends Mock implements AddUserUseCase {}

void main() {
  late UsersBloc bloc;
  late MockGetUsers getUsers;
  late MockAddUser addUser;

  final users = [User(userId: '1', name: 'A'), User(userId: '2', name: 'B')];

  setUp(() {
    getUsers = MockGetUsers();
    addUser = MockAddUser();

    bloc = UsersBloc(getUsers: getUsers, addUser: addUser);
  });

  tearDown(() => bloc.close());

  blocTest<UsersBloc, UsersState>(
    'LoadUsers emits Loading then Loaded',
    build: () {
      when(() => getUsers()).thenReturn(users);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadUsers()),
    expect: () => [UsersLoading(), UsersLoaded(users)],
  );

  blocTest<UsersBloc, UsersState>(
    'AddUserEvent adds user and reloads list',
    build: () {
      when(() => addUser('C')).thenAnswer((_) async {});
      when(
        () => getUsers(),
      ).thenReturn([...users, User(userId: '3', name: 'C')]);
      return bloc;
    },
    act: (bloc) => bloc.add(AddUserEvent('C')),
    expect: () => [
      UsersLoaded([
        User(userId: '1', name: 'A'),
        User(userId: '2', name: 'B'),
        User(userId: '3', name: 'C'),
      ]),
    ],
  );
}
