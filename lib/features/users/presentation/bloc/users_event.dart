abstract class UsersEvent {}

/// Load users when page opens
class LoadUsers extends UsersEvent {}

/// Add a new user
class AddUserEvent extends UsersEvent {
  final String name;

  AddUserEvent(this.name);
}
