part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartOnLoadEvent extends CartEvent {}

class RemoveItemFromCartEvent extends CartEvent {
  final ProductId productId;
  const RemoveItemFromCartEvent({required this.productId});
}
