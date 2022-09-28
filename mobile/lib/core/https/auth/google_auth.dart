import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking_lot/core/https/auth/base_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthOption extends BaseAuthOption {}

class GoogleAuth extends BaseAuth<GoogleAuthOption> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<AuthCredential?> getCredential(GoogleAuthOption options) async {
    if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    OAuthCredential? credential;

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    }

    return credential;
  }
}
