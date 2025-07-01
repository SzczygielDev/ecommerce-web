part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthenticationEvent {}

class LogOutRequestEvent extends AuthenticationEvent {}

class UserLoggedOutEvent extends AuthenticationEvent {}

class UserDataAcquiredEvent extends AuthenticationEvent {
  final UserInfo user;

  const UserDataAcquiredEvent(this.user);

  @override
  List<Object> get props => [user];
}
