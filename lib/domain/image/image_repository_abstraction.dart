import 'dart:typed_data';

import 'package:ecommerce_web/domain/image/image_id.dart';

abstract class ImageRepositoryAbstraction {
  Future<ImageId?> uploadImage(Uint8List bytes, String fileName);
}
