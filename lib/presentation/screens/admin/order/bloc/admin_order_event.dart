part of 'admin_order_bloc.dart';

sealed class AdminOrderEvent extends Equatable {
  const AdminOrderEvent();

  @override
  List<Object> get props => [];
}

class AdminOrderOnLoadEvent extends AdminOrderEvent {}
