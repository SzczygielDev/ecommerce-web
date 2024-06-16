part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoadedState extends CartState {
  final List<CartItem> items;
  final ClientData clientData;
  final DeliveryData deliveryData;
  final double cartTotal;

  const CartLoadedState(
      {required this.items,
      required this.clientData,
      required this.cartTotal,
      required this.deliveryData});

  CartLoadedState copyWith({
    List<CartItem>? items,
    ClientData? clientData,
    double? cartTotal,
    DeliveryData? deliveryData,
  }) {
    return CartLoadedState(
        clientData: clientData ?? this.clientData,
        cartTotal: cartTotal ?? this.cartTotal,
        deliveryData: deliveryData ?? this.deliveryData,
        items: items ?? this.items);
  }

  @override
  List<Object> get props => [items, clientData, deliveryData];
}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {}
