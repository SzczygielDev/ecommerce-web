import 'dart:typed_data';

import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductImageSelector extends StatefulWidget {
  final Function(Uint8List bytes, String fileName) onSelected;
  const ProductImageSelector({super.key, required this.onSelected});

  @override
  State<ProductImageSelector> createState() => _ProductImageSelectorState();
}

class _ProductImageSelectorState extends State<ProductImageSelector> {
  Uint8List? fileBytes;
  String? fileName;
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (fileBytes == null || fileName == null) {
          return "Pole wymagane";
        }
        return null;
      },
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
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
                      style: AppTypography.medium3,
                    ),
                    const Text(
                      "lub",
                      style: AppTypography.medium3,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          FilePicker.platform.pickFiles().then(
                            (result) {
                              final bytes = result?.files.firstOrNull?.bytes;
                              final name = result?.files.first.name;
                              if (bytes != null && name != null) {
                                widget.onSelected(bytes, name);
                                setState(() {
                                  fileBytes = bytes;
                                  fileName = name;
                                });
                              }
                            },
                          );
                        },
                        child: const Text("Wybierz plik"))
                  ],
                ),
              ),
            ),
          ),
          field.hasError
              ? Text(
                  field.errorText ?? "",
                  style: AppTypography.xsmall2
                      .merge(const TextStyle(color: AppColors.red)),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
