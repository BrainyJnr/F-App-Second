

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class fFirebaseException implements Exception {

  final String code;

  fFirebaseException(this.code);

  String get message {
    switch (code) {
      case "unknown":
        return "An unknown Firebase error occurred. Please try again.";
      case "invalid-custom-token":
        return "The custom token format is incorrect. Please check your custom token.";
      case "custom-token-mismatch":
        return "The custom token corresponds to a different audience.";
      case "user-disabled":
        return "The user account has been disabled";
      case "user-not-found":
        return "No user found for the given email or UID";
      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email.";
      case "email-already-in-use":
        return "The email address is already registered. Please enter a valid email";
      case  "Wrong-password":
        return "The Password is in invalid. Please check your password and try again.";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password";
      case "Provider-already-linked":
        return "The account is already linked with another provider.";
      case "operation-not-allowed":
        return "This operation is not allowed.Contact support for assistance";
      case "invalid credential":
        return "The supplied credential is malformed or has expired";
      case "invalid-Verification-code":
        return "invalid-verification Code. Please enter a valid Code";
      case "invalid-verification-id":
        return "invalid verification ID. Please enter a new verification code";
      case "captcha-check-failed":
        return "The reCAPTHA response is invalid. Please try again.";
      case "app-not-authorized":
        return "The app is not authorised to use Firebase Authentication API key";
      case "keychain-error":
        return "A keychain error occured. Please check the keychain and try again.";
      case "Internet-error":
        return "An internal authentication error occurred. Please try again later";
      case "invalid-app-credential":
        return "The app credential is invalid. Please provide a valid app credential";
      case "user-mismatch":
        return "The supplied credentials do not correspond to the prevoiusly signed-in user";
      case "Quota-exceeded":
        return "Quota exceeded. Please try again later";
      case "account-exists-with-different-credentials":
        return "An account already exists with the same email but different sign-in credentials";
      case "missing-iframe-start":
        return "The email template is missing the iframe start tag";
      case "missing-iframe-end":
        return "The email template is missing the iframe end tag";
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
      case "in-valid-message-payload.":
        return "The email template verification message payload is invalid";
      case "invalid-sender":
        return "The email template sender sender is invalid. Please verify the sender\"s email.";
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
    case "INVALID_LOGIN_CREDENTIALS":
    return "Invalid login credentials.PLease double-check your information";
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
    case "invalid-verification-code":
    return "Invalid-verification-code. Please enter a valid code.";
    case "invalid-verification-id":
    return "Invalid-verification-ID. Please enter a valid ID.";
      case "wrong password":
        return "Incorrect password. Please check your password and try again";
      case "The supplied auth credential is incorrect, malformed or has expired.":
        return "Incorrect password. Please check your password and try again";
    default:
    return "An Unexpected Firebase error occurred. please try again";

    //default:
     //   return "An Unexpected Firebase error occurred. please try again";


    }
  }
}