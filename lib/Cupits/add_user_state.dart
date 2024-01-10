part of 'add_user_cubit.dart';

@immutable
abstract class AddUserState {}

class AddUserInitial extends AddUserState {}

class AddUsersLoading extends AddUserState {}

class AddUsersSuccess extends AddUserState {
  final MUser user;

  AddUsersSuccess(this.user);
}

class AddUsersError extends AddUserState {
  final String error;

  AddUsersError(this.error);
}
