import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';

class FirestoreListModel<T extends BaseFirestoreModel> {
  final List<T> items;
  final String? nextPageKey;

  FirestoreListModel({
    required this.items,
    this.nextPageKey,
  });
}
