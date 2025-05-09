import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_web/presentation/screens/cart/model/cart_item.dart';
import 'package:ecommerce_web/presentation/util/image/image_url_resolver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartEntryWidget extends StatelessWidget {
  final CartItem item;
  const CartEntryWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          color: AppColors.grey,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                color: AppColors.shimmerGrey,
                child: Image.network(
                    ImageUrlResolver.getUrlForImage(item.imageId)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: AppTypography.medium1),
                    Text(
                      item.subtitle,
                      style: AppTypography.small1
                          .merge(const TextStyle(color: AppColors.darkGrey)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("${item.price} ZŁ", style: AppTypography.medium1),
              ),
              SizedBox(
                width: 110,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  initialValue: item.quantity.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                        RemoveItemFromCartEvent(productId: item.productId));
                  },
                  icon: const Icon(Icons.clear)),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
