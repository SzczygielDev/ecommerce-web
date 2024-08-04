import 'dart:typed_data';

import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductImageSelector extends StatefulWidget {
  final Function(Uint8List bytes) onSelected;
  const ProductImageSelector({super.key, required this.onSelected});

  @override
  State<ProductImageSelector> createState() => _ProductImageSelectorState();
}

class _ProductImageSelectorState extends State<ProductImageSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.image),
            const Text(
              "Przeciągnij i upuść zdjęcie",
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "lub",
              style: TextStyle(fontSize: 24),
            ),
            OutlinedButton(
                onPressed: () {
                  FilePicker.platform.pickFiles().then(
                    (result) {
                      final bytes = result?.files.firstOrNull?.bytes;
                      if (bytes != null) {
                        widget.onSelected(bytes);
                      }
                    },
                  );
                },
                child: const Text("Wybierz plik"))
          ],
        ),
      ),
    );
  }
}
