part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class UnauthenticatedState extends AuthenticationState {}

final class AuthenticatedState extends AuthenticationState {
  final UserInfo user;

  const AuthenticatedState(this.user);

  @override
  List<Object> get props => [user];
}
