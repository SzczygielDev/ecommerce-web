import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductImageSelectorPreview extends StatefulWidget {
  final Uint8List fileBytes;
  final Function() onRemove;
  const ProductImageSelectorPreview(
      {super.key, required this.fileBytes, required this.onRemove});

  @override
  State<ProductImageSelectorPreview> createState() =>
      _ProductImageSelectorPreviewState();
}

class _ProductImageSelectorPreviewState
    extends State<ProductImageSelectorPreview> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.memory(widget.fileBytes),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: widget.onRemove,
              icon: const Icon(
                Icons.close,
                size: 42,
              )),
        )
      ],
    );
  }
}
