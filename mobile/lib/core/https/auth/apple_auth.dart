import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking_lot/core/https/auth/base_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthOption extends BaseAuthOption {}

class AppleAuth extends BaseAuth<AppleAuthOption> {
  final OAuthProvider _oAuthProvider = OAuthProvider("apple.com");

  @override
  Future<AuthCredential?> getCredential(AppleAuthOption options) async {
    AuthorizationCredentialAppleID? result = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    OAuthCredential? credential;
    if (result.identityToken != null) {
      credential = _oAuthProvider.credential(
        idToken: String.fromCharCodes(result.identityToken?.codeUnits ?? []),
        accessToken: String.fromCharCodes(result.authorizationCode.codeUnits),
      );
    }

    return credential;
  }
}
