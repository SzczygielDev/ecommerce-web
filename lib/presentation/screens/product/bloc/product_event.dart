part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductOnLoadEvent extends ProductEvent {
  final ProductId id;

  const ProductOnLoadEvent(this.id);
}

class ProductAddToCartEvent extends ProductEvent {
  final int quantity;

  const ProductAddToCartEvent(this.quantity);
}

class AddedToCartOverlayShowedEvent extends ProductEvent {}
