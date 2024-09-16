import 'package:ecommerce_web/config/locator.dart';
import 'package:logger/logger.dart';

class RepositoryBase {
  final _logger = locator.get<Logger>();
  void defaultErrorHandler(Exception exception) {
    _logger.e(exception);
  }
}
