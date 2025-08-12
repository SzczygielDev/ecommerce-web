part of 'admin_client_bloc.dart';

enum AdminClientLoadingState { working, success, error }

class AdminClientState extends Equatable {
  final AdminClientLoadingState loadingState;
  final List<Client> clients;
  const AdminClientState(
      {this.loadingState = AdminClientLoadingState.working,
      this.clients = const []});
  AdminClientState copyWith(
      {AdminClientLoadingState? loadingState, List<Client>? clients}) {
    return AdminClientState(
        clients: clients ?? this.clients,
        loadingState: loadingState ?? this.loadingState);
  }

  @override
  List<Object> get props => [loadingState, clients];
}
