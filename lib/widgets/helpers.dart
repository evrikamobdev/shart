import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ### ## ##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);

String? validateMobile(value) {
  if (value!.isEmpty) {
    return 'Обязательное поле';
  }
  // else if (value.length != 18) {
  //   return 'Формат неверный';
  // }
  return null;
}

String? validateRequiredField(value) =>
    value!.isEmpty ? 'Обязательное поле' : null;
