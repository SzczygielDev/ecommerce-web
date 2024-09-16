import 'package:ecommerce_web/domain/delivery/delivery_provider.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartDeliveryProviderWidget extends StatelessWidget {
  final DeliveryProvider provider;
  final bool selected;
  const CartDeliveryProviderWidget(
      {super.key, required this.provider, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        shape: RoundedRectangleBorder(
          side:
              BorderSide(color: selected ? AppColors.main : AppColors.darkGrey),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        selected: selected,
        onTap: () {
          context.read<CartBloc>().add(
              SelectDeliveryProviderEvent(deliveryProviderKey: provider.key));
        },
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            provider.displayName,
            style: AppTypography.small1.merge(
                TextStyle(fontWeight: selected ? FontWeight.bold : null)),
          ),
        ),
        trailing: SvgPicture.network(
          provider.logoUrl.toString(),
          height: 24,
        ),
      ),
    );
  }
}
