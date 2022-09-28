import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class BaseAuthOption {}

abstract class BaseAuth<T extends BaseAuthOption> {
  Future<AuthCredential?> getCredential(T options);

  BaseAuth();

  String? errorMessage;
  Future<User?> connect(T options) async {
    errorMessage = null;

    AuthCredential? credential = await getCredential(options);
    if (credential == null) return null;

    try {
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
      } else {
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return FirebaseAuth.instance.currentUser;
    } on FirebaseException catch (e) {
      if (kDebugMode) print("ERROR: getCredential $e");
      errorMessage = e.message;
      return null;
    }
  }
}
