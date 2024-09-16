part of 'cart_bloc.dart';

enum CartLoadingState { loading, loaded, error }

enum CartSubmitState { idle, inProgress, redirect }

class CartState extends Equatable {
  final CartId? cartId;
  final List<CartItem>? items;
  final ClientData? clientData;
  final List<DeliveryProvider> deliveryProviders;
  final DeliveryProvider? selectedDeliveryProvider;
  final double? cartTotal;
  final CartLoadingState loadingState;
  final List<PaymentServiceProvider> paymentProviders;
  final PaymentServiceProvider? selectedPaymentProvider;
  final CartSubmitState cartSubmitState;
  final String? redirectUrl;
  const CartState(
      {this.items,
      this.clientData,
      this.cartTotal,
      this.selectedDeliveryProvider,
      this.loadingState = CartLoadingState.loading,
      this.deliveryProviders = const [],
      this.paymentProviders = const [],
      this.selectedPaymentProvider,
      this.cartSubmitState = CartSubmitState.idle,
      this.redirectUrl,
      this.cartId});

  CartState copyWith(
      {List<CartItem>? items,
      ClientData? clientData,
      double? cartTotal,
      CartLoadingState? loadingState,
      List<DeliveryProvider>? deliveryProviders,
      DeliveryProvider? selectedDeliveryProvider,
      List<PaymentServiceProvider>? paymentProviders,
      PaymentServiceProvider? selectedPaymentProvider,
      CartSubmitState? cartSubmitState,
      String? redirectUrl,
      CartId? cartId}) {
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
        paymentProviders: paymentProviders ?? this.paymentProviders,
        cartSubmitState: cartSubmitState ?? this.cartSubmitState,
        redirectUrl: redirectUrl ?? this.redirectUrl,
        cartId: cartId ?? this.cartId);
  }

  bool get canSubmit {
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
        selectedPaymentProvider,
        cartSubmitState,
        redirectUrl,
        cartId
      ];
}
