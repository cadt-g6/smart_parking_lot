import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_parking_lot/core/https/firestore/base_cloud_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/models/firestore_list_model.dart';
import 'package:smart_parking_lot/core/https/firestore/models/user_firestore_model.dart';

class UsersFirestore extends BaseCloudFirestore<UserFirestoreModel> {
  @override
  String get collectionName => "users";

  @override
  Future<UserFirestoreModel> toObject(Map<String, dynamic> json) {
    return compute(_toObject, json);
  }

  @override
  Query<Map<String, dynamic>> buildQuery({
    required Map<String, dynamic> options,
  }) {
    String? phoneNumber = options['login'];
    if (phoneNumber != null) {
      return collectionRef.where(
        "login",
        arrayContainsAny: [phoneNumber],
      );
    }
    throw UnimplementedError();
  }

  Future<FirestoreListModel<UserFirestoreModel>?> fetchUsers(
    String phoneNumber,
  ) async {
    return fetchAll(options: {'login': phoneNumber});
  }

  @override
  UserFirestoreModel toObjectAsync(Map<String, dynamic> json) => _toObject(json);
}

UserFirestoreModel _toObject(Map<String, dynamic> json) {
  return UserFirestoreModel.fromJson(json);
}
