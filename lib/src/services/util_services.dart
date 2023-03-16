import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UtilServices {
  final maskFormatterPhone = MaskTextInputFormatter(
    mask: '(##) ##### - ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  MaskTextInputFormatter formatterPhone() {
    return maskFormatterPhone;
  }
}
