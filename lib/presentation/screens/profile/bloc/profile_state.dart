part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadingErrorState extends ProfileState {
  final String message;

  const ProfileLoadingErrorState({required this.message});
}

final class ProfileLoadedState extends ProfileState {
  final Client client;
  final ProfileUpdatingState profileUpdatingState;
  final String? profileUpdatingErrorMessage;
  final List<Order> orders;

  const ProfileLoadedState(
      {required this.client,
      this.profileUpdatingState = ProfileUpdatingState.idle,
      this.profileUpdatingErrorMessage,
      this.orders = const []});

  ProfileLoadedState copyWith(
      {Client? client,
      ProfileUpdatingState? profileUpdatingState,
      String? profileUpdatingErrorMessage,
      List<Order>? orders}) {
    return ProfileLoadedState(
        client: client ?? this.client,
        profileUpdatingState: profileUpdatingState ?? this.profileUpdatingState,
        profileUpdatingErrorMessage:
            profileUpdatingErrorMessage ?? this.profileUpdatingErrorMessage,
        orders: orders ?? this.orders);
  }

  @override
  List<Object?> get props =>
      [client, profileUpdatingState, profileUpdatingErrorMessage, orders];
}
