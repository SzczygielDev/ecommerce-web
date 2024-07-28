import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitCartButton extends StatelessWidget {
  const SubmitCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final loaded = state.loadingState == CartLoadingState.loaded;
        final total = state.cartTotal;
        final submitState = state.cartSubmitState;
        final enabled =
            state.canSubmit && loaded && submitState == CartSubmitState.idle;

        return OutlinedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size.fromHeight(80),
            ),
            onPressed: enabled
                ? () {
                    context.read<CartBloc>().add(CartSubmitEvent());
                  }
                : null,
            child: Builder(
              builder: (context) {
                if (submitState != CartSubmitState.idle) {
                  return const CircularProgressIndicator();
                }
                if (total == null) {
                  return const Text("Zamawiam",
                      style: TextStyle(color: AppColors.main, fontSize: 20));
                } else {
                  return Text("Zamawiam    ${total.toStringAsFixed(2)} ZŁ",
                      style:
                          const TextStyle(color: AppColors.main, fontSize: 20));
                }
              },
            ));
      },
    );
  }
}
