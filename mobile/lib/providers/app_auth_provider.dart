import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_parking_lot/core/https/firestore/models/user_firestore_model.dart';
import 'package:smart_parking_lot/core/https/firestore/users_firestore.dart';
import 'package:smart_parking_lot/core/base/base_view_model.dart';

class AppAuthProvider extends BaseViewModel {
  static final AppAuthProvider instance = AppAuthProvider._();
  User? get firebaseUser => FirebaseAuth.instance.currentUser;
  UserFirestoreModel? get user => _user;

  UserFirestoreModel? _user;

  AppAuthProvider._() {
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      String? uid = event?.uid;
      if (uid == null) {
        _user = null;
        notifyListeners();
      } else if (_user == null || _user?.id != uid) {
        _user = await UsersFirestore().fetchOne(uid);
        if (_user == null) await createDefaultUser(uid);
        _user = await UsersFirestore().fetchOne(uid);
        notifyListeners();
      }
    });
  }

  Future<void> initialize() async {
    String? uid = firebaseUser?.uid;
    if (uid == null) return;
    _user = await UsersFirestore().fetchOne(uid);
    notifyListeners();
  }

  Future<void> createDefaultUser(String uid) async {
    final createdAt = DateTime.now().toIso8601String();
    List<String> login = [uid];

    String? phoneNumber = firebaseUser?.phoneNumber;
    if (phoneNumber != null) {
      login.add(phoneNumber);
    }

    await UsersFirestore().set(
      id: uid,
      data: UserFirestoreModel(
        firstName: null,
        lastName: null,
        dob: null,
        createdAt: createdAt,
        updatedAt: createdAt,
        id: uid,
        profileUrl: null,
        login: login,
      ),
    );
  }

  void updateFirstName(String name) async {
    String? id = user?.id;
    if (id != null) {
      await UsersFirestore().update(
        id: id,
        data: {'first_name': name},
      );
      initialize();
    }
  }

  void updateLastName(String name) async {
    String? id = user?.id;
    if (id != null) {
      await UsersFirestore().update(
        id: id,
        data: {'last_name': name},
      );
      initialize();
    }
  }
}
