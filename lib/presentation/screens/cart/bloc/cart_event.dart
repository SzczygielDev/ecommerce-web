part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartOnLoadEvent extends CartEvent {
  const CartOnLoadEvent();
}

class RemoveItemFromCartEvent extends CartEvent {
  final ProductId productId;
  const RemoveItemFromCartEvent({required this.productId});
}

class CartSubmitEvent extends CartEvent {}

class SelectDeliveryProviderEvent extends CartEvent {
  final DeliveryProviderKey deliveryProviderKey;

  const SelectDeliveryProviderEvent({required this.deliveryProviderKey});
}

class SelectPaymentServiceProviderEvent extends CartEvent {
  final PaymentServiceProviderKey paymentServiceProviderKey;

  const SelectPaymentServiceProviderEvent(
      {required this.paymentServiceProviderKey});
}

class CartSubmitErrorDialogShowedEvent extends CartEvent {}
