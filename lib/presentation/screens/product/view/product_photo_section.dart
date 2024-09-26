import 'package:ecommerce_web/domain/image/image_id.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/util/image/image_url_resolver.dart';
import 'package:flutter/material.dart';

class ProductPhotoSection extends StatelessWidget {
  final ImageId imageId;
  const ProductPhotoSection({super.key, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              color: AppColors.shimmerGrey,
              child: Image.network(ImageUrlResolver.getUrlForImage(imageId)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            color: AppColors.shimmerGrey,
            child: const Center(
              child: Text("Galeria"),
            ),
          ),
        ],
      ),
    );
  }
}
