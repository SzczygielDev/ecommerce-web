part of 'admin_client_bloc.dart';

sealed class AdminClientEvent extends Equatable {
  const AdminClientEvent();

  @override
  List<Object> get props => [];
}

class AdminClientOnLoadEvent extends AdminClientEvent {}
