import 'package:ecommerce_web/config/app_consts.dart';
import 'package:ecommerce_web/domain/image/image_id.dart';

class ImageUrlResolver {
  static String getUrlForImage(ImageId id) {
    return "${AppConsts.s3Url}/${id.value}";
  }
}
