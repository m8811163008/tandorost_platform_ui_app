import 'package:formz/formz.dart';

enum TextInputError { empty }

class TextInput extends FormzInput<String, TextInputError>
    with FormzInputErrorCacheMixin {
  TextInput.pure([super.value = '']) : super.pure();

  TextInput.dirty([super.value = '']) : super.dirty();



  @override
  TextInputError? validator(String value) {
    return super.value.isEmpty ? TextInputError.empty : null;
  }
}