import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/image/image_id.dart';
import 'package:ecommerce_web/domain/image/image_repository_abstraction.dart';
import 'package:ecommerce_web/infrastructure/repository/common/repository_base.dart';
import 'package:mime/mime.dart';

class ImageRepository extends RepositoryBase
    implements ImageRepositoryAbstraction {
  final dio = locator.get<Dio>();

  @override
  Future<ImageId?> uploadImage(Uint8List bytes, String fileName) async {
    try {
      final mediaType = lookupMimeType('', headerBytes: bytes);
      if (mediaType == null) {
        throw Exception("Failed to lookup mime type");
      }

      final dioMediaType = DioMediaType.parse(mediaType);

      final response = await dio.post('/images',
          options: Options(contentType: dioMediaType.mimeType),
          data: FormData.fromMap({
            'file': MultipartFile.fromBytes(bytes,
                filename: fileName, contentType: dioMediaType),
          }));

      return ImageId(response.data['id']);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }
}
