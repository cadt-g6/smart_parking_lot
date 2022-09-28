import 'package:smart_parking_lot/core/https/firestore/models/user_firestore_model.dart';
import 'package:smart_parking_lot/core/https/firestore/users_firestore.dart';

class FetchUserService {
  FetchUserService._();
  static final FetchUserService instance = FetchUserService._();

  final Map<String, UserFirestoreModel?> _map = {};

  Future<UserFirestoreModel?> get(String id) async {
    _map[id] ??= await UsersFirestore().fetchOne(id);
    return _map[id];
  }
}
