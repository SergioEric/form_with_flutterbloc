import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum UserNameError {
  empty,
  toShort,
}

// this is optional, but it made more clean our code
extension ErrorMessagesInUserName on UserNameError {
  // in the form widget, we will use like this
  // field?.error?.asString -> which returns error as String
  String get asString {
    switch (this) {
      case UserNameError.empty:
        return 'Campo vacio';
        break;
      case UserNameError.toShort:
        return 'Username muy corto';
        break;
    }

    return describeEnum(this);
  }
}

// Extend FormzInput and provide the input type and error type.
class UserName extends FormzInput<String, UserNameError> {
  // Call super.pure to represent an unmodified form input.
  const UserName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserName.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UserNameError validator(String value) {
    if (value.length <= 4) return UserNameError.toShort;

    if (value.isEmpty) return UserNameError.empty;

    return null;
  }
}
