
import 'package:flutter/services.dart';

class fFormatException implements Exception {

  final String message;


  const fFormatException([this.message = "An unexpected format error occurred. Please check your input."]);

  factory fFormatException.fromMessage(String message) {
    return fFormatException(message);
  }

  String get formattedMessage => message;

  factory fFormatException.fromCode(String code) {
    switch (code) {
      case "invalid-email-format":
        return const fFormatException("The email address format is invalid. Please enter a valid email."); case "wrong password":
      case "invalid-verification-code":
        return const fFormatException("The Password you entered is incorrect");
      case "invalid-data-format":
        return const fFormatException("The data format  is invalid. Please enter a valid date.");
      case "invalid-url-format":
        return const fFormatException("The URL  format is invalid. Please enter a valid URL.");
      case "invalid-credit card-format":
        return const fFormatException("The credit card format is invalid. Please enter a valid credit card number.");
      case "invalid-numeric-format":
        return const fFormatException("The input should be a valid numeric format.");
        default:
                return const fFormatException();









    }
  }

}