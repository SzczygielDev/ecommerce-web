import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_id.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/domain/delivery/delivery_provider_key.dart';
import 'package:ecommerce_web/domain/delivery/delivery_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_repository_abstraction.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider.dart';
import 'package:ecommerce_web/domain/payment/payment_service_provider_key.dart';
import 'package:ecommerce_web/domain/payment/payment_service_providers.dart';
import 'package:ecommerce_web/domain/payment/payment_status.dart';
import 'package:ecommerce_web/domain/product/product_id.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/cart_item.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/client_data.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositoryAbstraction cartRepository;
  final ProductRepositoryAbstraction productRepository;
  final DeliveryRepositoryAbstraction deliveryRepository;
  final PaymentRepositoryAbstraction paymentRepository;
  final OrderRepositoryAbstraction orderRepository;
  CartBloc({
    required this.cartRepository,
    required this.productRepository,
    required this.deliveryRepository,
    required this.paymentRepository,
    required this.orderRepository,
  }) : super(const CartState()) {
    on<CartOnLoadEvent>(_cartOnLoad);
    on<RemoveItemFromCartEvent>(_removeItemFromCart);
    on<CartSubmitEvent>(_submitCart);
    on<SelectDeliveryProviderEvent>(_selectDeliveryProvider);
    on<SelectPaymentServiceProviderEvent>(_selectPaymentServiceProvider);
  }

  Future<void> _cartOnLoad(CartOnLoadEvent event, Emitter emit) async {
    final cart = await cartRepository.getCart();
    final deliveryProviders = await deliveryRepository.getDeliveryProviders();
    final paymentServiceProviders =
        await paymentRepository.getPaymentServiceProviders();
    if (cart == null) {
      emit(state.copyWith(loadingState: CartLoadingState.error));
      return;
    }

    final items = await _getItemsForCart(cart);
    if (items == null) {
      emit(state.copyWith(loadingState: CartLoadingState.error));
      return;
    }

    emit(state.copyWith(
        loadingState: CartLoadingState.loaded,
        items: items.nonNulls.toList(),
        paymentProviders: paymentServiceProviders,
        clientData: ClientData(
            firstName: "Jan",
            lastName: "Nowak",
            addressFirstLine: "Wiejska 4",
            addressSecondLine: "00-902 Warszawa",
            phoneNumber: "+48 123 123 123"),
        deliveryProviders: deliveryProviders,
        cartId: cart.id,
        cartTotal: cart.total));
  }

  Future<void> _removeItemFromCart(
      RemoveItemFromCartEvent event, Emitter emit) async {
    final cart = await cartRepository.removeProductFromCart(event.productId);

    if (cart == null) {
      //error
      return;
    }
    final items = await _getItemsForCart(cart);
    if (items == null) {
      emit(state.copyWith(loadingState: CartLoadingState.error));
      return;
    }

    emit(state.copyWith(cartTotal: cart.total, items: items));
  }

  Future<List<CartItem>?> _getItemsForCart(Cart cart) async {
    var products = await Future.wait(
        cart.products.map((item) => item.productId).toSet().map((productId) {
      return productRepository.findById(productId);
    }).toList());

    if (products.contains(null)) {
      return null;
    }
    var foundProducts = products.nonNulls.toList();

    final items = cart.products.map(
      (e) {
        final productForEntry = foundProducts.firstWhereOrNull(
          (product) => product.id.value == e.productId.value,
        );

        if (productForEntry == null) {
          return null;
        }

        return CartItem(
            productId: productForEntry.id,
            title: productForEntry.title,
            subtitle: "Atrybut A / Atrybut B",
            price: productForEntry.price,
            quantity: e.quantity);
      },
    ).toList();

    if (items.contains(null)) {
      return null;
    }
    return items.nonNulls.toList();
  }

  Future<void> _submitCart(CartSubmitEvent event, Emitter emit) async {
    emit(state.copyWith(cartSubmitState: CartSubmitState.inProgress));
    final selectedDeliveryProvider = state.selectedDeliveryProvider;
    final selectedPaymentServiceProvider = state.selectedPaymentProvider;

    if (selectedDeliveryProvider == null ||
        selectedPaymentServiceProvider == null) {
      return;
    }

    final mappedPaymentServiceProvider =
        selectedPaymentServiceProvider.mappedPSP;

    if (mappedPaymentServiceProvider == null) {
      return;
    }

    await cartRepository.submitCart(
        selectedDeliveryProvider, selectedPaymentServiceProvider);

    final order = await orderRepository.getOrderByCartId(state.cartId!);
    emit(state.copyWith(
        cartSubmitState: CartSubmitState.redirect,
        redirectUrl: order!.payment.paymentURL));
  }

  Future<void> _selectDeliveryProvider(
      SelectDeliveryProviderEvent event, Emitter emit) async {
    final foundProvider = state.deliveryProviders.firstWhereOrNull(
      (provider) => provider.key == event.deliveryProviderKey,
    );
    emit(state.copyWith(selectedDeliveryProvider: foundProvider));
  }

  Future<void> _selectPaymentServiceProvider(
      SelectPaymentServiceProviderEvent event, Emitter emit) async {
    final foundProvider = state.paymentProviders.firstWhereOrNull(
      (provider) => provider.key == event.paymentServiceProviderKey,
    );
    emit(state.copyWith(selectedPaymentProvider: foundProvider));
  }
}
