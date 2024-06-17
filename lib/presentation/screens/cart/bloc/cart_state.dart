part of 'cart_bloc.dart';

enum CartLoadingState { loading, loaded, error }

class CartState extends Equatable {
  final List<CartItem>? items;
  final ClientData? clientData;
  final DeliveryData? deliveryData;
  final double? cartTotal;
  final CartLoadingState loadingState;

  const CartState(
      {this.items,
      this.clientData,
      this.cartTotal,
      this.loadingState = CartLoadingState.loading,
      this.deliveryData});

  CartState copyWith({
    List<CartItem>? items,
    ClientData? clientData,
    double? cartTotal,
    CartLoadingState? loadingState,
    DeliveryData? deliveryData,
  }) {
    return CartState(
        clientData: clientData ?? this.clientData,
        loadingState: loadingState ?? this.loadingState,
        cartTotal: cartTotal ?? this.cartTotal,
        deliveryData: deliveryData ?? this.deliveryData,
        items: items ?? this.items);
  }

  @override
  List<Object?> get props =>
      [items, clientData, deliveryData, cartTotal, loadingState];
}
