import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, toShort }

// this is optional, but it made more clean our code
// also, you dont have to explicit on the textField widget
extension NameInputErrorAsString on PasswordError {
  String get asString {
    switch (this) {
      case PasswordError.empty:
        return 'Campo vacio';
        break;
      case PasswordError.toShort:
        return 'Contraseña muy corta';
        break;
    }
    // describeNum comes from foundation package
    return describeEnum(this);
  }
}

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty({String value = ''}) : super.dirty(value);

  // Validator return error if we pass PasswordError,
  // if there is not errors, we have to pass Null
  @override
  PasswordError validator(String value) {
    if (value.length <= 4) return PasswordError.toShort;

    // in this case we can handle in other ways, like making
    // password *pure* again
    if (value.isEmpty) return PasswordError.empty;

    return null;
  }
}
