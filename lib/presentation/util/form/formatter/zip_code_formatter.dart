import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ZipCodeFormatter extends MaskTextInputFormatter {
  ZipCodeFormatter()
      : super(
            mask: '##-###',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy);
}
