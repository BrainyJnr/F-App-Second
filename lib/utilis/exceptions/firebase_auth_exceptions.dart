

class fFirebaseAuthException implements Exception {

  final String code;

  fFirebaseAuthException (this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case "email-already-in-use":
        return "The email address is already registered. Please use a different email.";
      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password";
      case "user-disabled":
        return "This user account has been disabled. Please contact support for assistance";
      case "user-not-found":
        return "invalid login details. User not found";
      case "wrong password":
        return "Incorrect password. Please check your password and try again";
      case "invalid-verification-id":
        return "Invalid verification ID. Please request a new verification code";
      case "Quota-exceeded":
        return "Quota exceeded. Please try again later";
      case "email-already-exists":
        return "The email address already exists.Please use a different email.";
      case "Provider-already-linked":
        return "The account is already linked with another provider.";
      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Please log in again.";
      case "credential-already-in-use":
        return "This credential is already associated with a different user account";
      case "user-mismatch":
        return "This supplied credentials do not correspond to the previously signed in user";
      case "account-exists-with-different-credentials":
        return "An account already exists with the email but different sign-in credentials";
      case "operation-not-allowed":
        return "This operation is not allowed.Contact support for assistance";
      case "expired-action-code":
        return "The action code has expired.please request for a new action code";
      case "invalid-action-code":
        return "The action code is invalid please check and try again";
      case "missing-action-code":
        return "The action code is missing please provide a valid action code";
      case "missing-action-code":
        return "The action code is missing. Please provide a valid action code";
      case "user-token-expired":
        return "No user\"s token has token has expired, and authentication is required. Please sign in again";
      case "invalid credential":
        return "The supplied credential is malformed or has expired";
      case "Wrong-password":
        return "The Password is in invalid. Please check your password and try again.";
      case "user-token-revoked":
        return "The user\"s token has been revoked. Please check your password and try again.";
        case "in-valid-message-payload.":
          return "The email template verification message payload is invalid";
      case "The supplied auth credential is incorrect, malformed or has expired.":
        return "Incorrect password. Please check your password and try again";
      case "invalid-sender":
        return "The email template sender is invalid. Please verify the sender\"s email.";
      case "invalid-recipient-email":
        return "The recipient email address is invalid.Please provide a valid recipient email";
      case "Internet-error":
        return "An internal authentication error occurred. Please try again later";
      case "missing-iframe-end":
        return "The email template is missing the iframe ebd tag.";
      case "missing-iframe-src":
        return "The email template is missing the iframe src attribution";
      case "auth-domain-config-required":
        return "The authDomain configuration is required for the action code verification link.";
      case "missing-app-credential":
        return "The app credential is missing. Please provide valid app credential";
      case "session-cookie-expired":
        return "The Firebase session cookie has expired. Please sign in again.";
      case "uid-already-exists":
        return "The provided user ID is already in use by another user.";
      case "web-storage-unsupported":
        return "Web storage is not supported or is disabled";
      case "app-deleted":
        return "This instance of FirebaseApp has been deleted";
      case "user-token-mismatch":
        return "The provided user\"s token has a mismatch with the authenticated user\"s user ID";
      case "invalid-recipient-email":
        return "The recipient email address is invalid.Please provide a valid recipient email";
      case "missing-action-code":
        return "The action code is missing. Please provide a valid action code";
      case "user-token-expired":
        return "No user\"s token has token has expired, and authentication is required. Please sign in again";
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login credentials.";
      case "expired-action-code":
        return "The action code has expired.please request for a new action code";
      case "invalid-action-code":
        return "The action code is invalid please check and try again";
      case "credential-already-in-use":
        return "This credentials is already associated with a different user account";
      case "too-many-requests":
        return "Too many requests. Please try again later.";
      case "invalid-arguments":
        return "Invalid argument provided to the authentication method.";
      case "invalid-password":
        return "Incorrect Password. Please try again.";
      case "invalid-phone-number":
        return "The provided phone number is invalid";
      case "operation-not-allowed":
        return "The sign-in provider is disabled for your Firebase project";
   //   case "session-cookie-expired":
     //   return "The Firebase session cookie has expired. Please sign in again.";
      case "uid-already-exists":
        return "The provided user ID is already in use by another user.";
      case "sign-in-failed. Please try again":
        return "Sign-in_failed. Please try again";
      case "network-request-failed":
        return "Network request failed. Please enable your internet connection";
      case "Internet-error":
        return "An internal authentication error occurred. Please try again later";
      case "invalid-verification-code":
        return "Invalid-verification-code. Please enter a valid code.";
      case "The supplied auth credential is incorrect, malformed or has expired.":
        return "Incorrect password. Please check your password and try again";
      case "app-deleted":
        return "This instance of F App has been deleted";

      default:
        return "Invalid Credentials";


    }

  }
}