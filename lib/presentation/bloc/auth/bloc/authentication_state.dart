part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

final class UnauthenticatedState extends AuthenticationState {}

final class AuthenticatedState extends AuthenticationState {
  final UserInfo user;
  final Client? client;
  const AuthenticatedState({required this.user, this.client});

  @override
  List<Object?> get props => [user, client];
}
