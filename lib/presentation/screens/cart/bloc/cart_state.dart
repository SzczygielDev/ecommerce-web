part of 'cart_bloc.dart';

enum CartLoadingState { loading, loaded, error }

class CartState extends Equatable {
  final List<CartItem>? items;
  final ClientData? clientData;
  final List<DeliveryProvider> deliveryProviders;
  final DeliveryProvider? selectedDeliveryProvider;
  final double? cartTotal;
  final CartLoadingState loadingState;
  final List<PaymentServiceProvider> paymentProviders;
  final PaymentServiceProvider? selectedPaymentProvider;
  const CartState(
      {this.items,
      this.clientData,
      this.cartTotal,
      this.selectedDeliveryProvider,
      this.loadingState = CartLoadingState.loading,
      this.deliveryProviders = const [],
      this.paymentProviders = const [],
      this.selectedPaymentProvider});

  CartState copyWith(
      {List<CartItem>? items,
      ClientData? clientData,
      double? cartTotal,
      CartLoadingState? loadingState,
      List<DeliveryProvider>? deliveryProviders,
      DeliveryProvider? selectedDeliveryProvider,
      List<PaymentServiceProvider>? paymentProviders,
      PaymentServiceProvider? selectedPaymentProvider}) {
    return CartState(
        clientData: clientData ?? this.clientData,
        loadingState: loadingState ?? this.loadingState,
        cartTotal: cartTotal ?? this.cartTotal,
        selectedDeliveryProvider:
            selectedDeliveryProvider ?? this.selectedDeliveryProvider,
        deliveryProviders: deliveryProviders ?? this.deliveryProviders,
        items: items ?? this.items,
        selectedPaymentProvider:
            selectedPaymentProvider ?? this.selectedPaymentProvider,
        paymentProviders: paymentProviders ?? this.paymentProviders);
  }

  bool canSubmit() {
    return selectedDeliveryProvider != null &&
        (items?.isNotEmpty ?? false) &&
        selectedPaymentProvider != null;
  }

  @override
  List<Object?> get props => [
        items,
        clientData,
        deliveryProviders,
        cartTotal,
        loadingState,
        selectedDeliveryProvider,
        paymentProviders,
        selectedPaymentProvider
      ];
}
