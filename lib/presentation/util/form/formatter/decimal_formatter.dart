import 'package:flutter/services.dart';

class DecimalFormatter extends FilteringTextInputFormatter {
  DecimalFormatter() : super(RegExp(r'[0-9.]'), allow: true);
}
