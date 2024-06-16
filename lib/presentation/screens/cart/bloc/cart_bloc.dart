import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:ecommerce_web/domain/cart/cart.dart';
import 'package:ecommerce_web/domain/cart/cart_repository_abstraction.dart';
import 'package:ecommerce_web/domain/product/product_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/cart_item.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/client_data.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/delivery_data.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositoryAbstraction cartRepository;
  final ProductRepositoryAbstraction productRepository;
  CartBloc({required this.cartRepository, required this.productRepository})
      : super(CartLoadingState()) {
    on<CartOnLoadEvent>((event, emit) async {
      final cart = await cartRepository.getCart();

      if (cart == null) {
        emit(CartErrorState());
        return;
      }

      var products = await Future.wait(
          cart.products.map((item) => item.productId).toSet().map((productId) {
        return productRepository.findById(productId);
      }).toList());

      if (products.contains(null)) {
        emit(CartErrorState());
        return;
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
              title: productForEntry.title,
              subtitle: "Atrybut A / Atrybut B",
              price: productForEntry.price,
              quantity: e.quantity);
        },
      ).toList();

      if (items.contains(null)) {
        emit(CartErrorState());
        return;
      }

      emit(CartLoadedState(
          items: items.nonNulls.toList(),
          clientData: ClientData(
              firstName: "Jan",
              lastName: "Nowak",
              addressFirstLine: "Wiejska 4",
              addressSecondLine: "00-902 Warszawa",
              phoneNumber: "+48 123 123 123"),
          deliveryData: DeliveryData(value: "Punkt odbioru WAW23"),
          cartTotal: cart.total));
    });
  }
}
