

class fPlatformException implements Exception {
  final String code;

  fPlatformException(this.code);

  String get message {
    switch (code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login credentials.PLease double-check your information";
      case "too-many-requests":
        return "Too many requests. Please try again later.";
      case "The supplied auth credential is incorrect, malformed or has expired.":
        return "Incorrect password. Please check your password and try again";
      case "invalid-arguments":
        return "Invalid argument provided to the authentication method.";
      case "invalid-password":
        return "Incorrect Password. Please try again.";
      case "invalid-phone-number":
        return "The provided phone number is invalid";
      case "operation-not-allowed":
        return "The sign-in provider is disabled for your Firebase project";
      case "session-cookie-expired":
        return "The Firebase session cookie has expired. Please sign in again.";
      case "uid-already-exists":
        return "The provided user ID is already in use by another user.";
      case "sign-in-failed. Please try again":
        return "Sign-in_failed. Please try again";
      case "network-request-failed":
        return "Network request failed. Please enable your internet connection";
      case "Internet-error":
        return "An internal authentication error occurred. Please try again later";
      case "wrong password":
        return "Incorrect password. Please check your password and try again";
      case "invalid-verification-code":
        return "Invalid-verification-code. Please enter a valid code.";
      case "invalid-verification-id":
        return "Invalid-verification-ID. Please enter a valid ID.";
      case "quota-exceeded":
        return "Quota exceeded. Please try again later.";
      default:
        return "An Unexpected Firebase error occurred. please try again";





    }
  }

}