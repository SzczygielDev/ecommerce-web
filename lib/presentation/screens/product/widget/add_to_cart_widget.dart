import 'package:ecommerce_web/presentation/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  final TextEditingController productQuantityController =
      TextEditingController();

  bool canAddToCart = true;

  @override
  void initState() {
    productQuantityController.text = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 8,
            child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: canAddToCart
                    ? () {
                        context.read<ProductBloc>().add(ProductAddToCartEvent(
                            int.parse(productQuantityController.text)));
                      }
                    : null,
                child: const Text("Dodaj do koszyka",
                    style: TextStyle(color: Colors.black, fontSize: 20)))),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: productQuantityController,
            maxLines: null,
            expands: true,
            onChanged: (value) {
              final number = int.tryParse(productQuantityController.text);
              setState(() {
                if (number != null && number > 0) {
                  canAddToCart = true;
                } else {
                  canAddToCart = false;
                }
              });
            },
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
