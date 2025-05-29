import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> authenticationLocally() async {
    bool isAuthenticate = false;
    try {
      isAuthenticate = await localAuth.authenticate(
        localizedReason: "We need to authenticate for using this app.",
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        print("Biometric authentication not available.");
      } else if (e.code == auth_error.notEnrolled) {
        print("No biometrics enrolled.");
      } else {
        print("PlatformException: ${e.message}");
      }
    } catch (error) {
      print("Error during authentication: $error");
    }
    return isAuthenticate;
  }
}
