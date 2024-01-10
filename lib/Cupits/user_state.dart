part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

// States for getting users
class GetUsersLoading extends UserState {}

class GetUsersSuccess extends UserState {
  final MUserResponse user;

  GetUsersSuccess(this.user);
}

class GetUsersError extends UserState {
  final String error;

  GetUsersError(this.error);
}
