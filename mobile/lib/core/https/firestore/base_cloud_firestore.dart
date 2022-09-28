import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/models/base_firestore_model.dart';
import 'package:smart_parking_lot/core/https/firestore/models/firestore_list_model.dart';

abstract class BaseCloudFirestore<T extends BaseFirestoreModel> {
  late final FirebaseFirestore db;
  late final CollectionReference<Map<String, dynamic>> collectionRef;

  late final String? overrideCollection;
  BaseCloudFirestore([this.overrideCollection]) {
    db = FirebaseFirestore.instance;
    collectionRef = db.collection(overrideCollection ?? collectionName);
  }

  String get collectionName;
  Future<T> toObject(Map<String, dynamic> json);
  T toObjectAsync(Map<String, dynamic> json);

  Query<Map<String, dynamic>> buildQuery({required Map<String, dynamic> options}) {
    throw UnimplementedError();
  }

  Stream<List<T>?> stream({
    String? orderBy,
    bool descending = true,
    Map<String, dynamic>? options,
  }) {
    Query<Map<String, dynamic>>? query = options != null ? buildQuery(options: options) : null;
    query = (query ?? collectionRef).orderBy(orderBy ?? 'created_at', descending: descending);

    return query.snapshots().map((query) {
      List<T> items = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> element in query.docs) {
        T object = toObjectAsync(element.data());
        items.add(object);
      }
      return items;
    });
  }

  Future<FirestoreListModel<T>?> fetchAll({
    String? nextPageKey,
    String? orderBy,
    bool descending = true,
    Map<String, dynamic>? options,
  }) async {
    Query<Map<String, dynamic>>? query = options != null ? buildQuery(options: options) : null;
    query = (query ?? collectionRef).orderBy(orderBy ?? 'created_at', descending: descending);
    if (nextPageKey != null) {
      query = query.startAfter([
        Timestamp.fromMillisecondsSinceEpoch(jsonDecode(nextPageKey)),
      ]);
    }

    List<T> items = [];
    QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> element in snapshot.docs) {
      items.add(await toObject(element.data()));
    }

    FirestoreListModel<T> list = FirestoreListModel<T>(
      items: items,
      nextPageKey: items.isNotEmpty ? jsonEncode(items.last.createdAt) : null,
    );

    return list;
  }

  Future<T?> fetchOne(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await collectionRef.doc(id).get();
    Map<String, dynamic>? data = snapshot.data();
    if (data != null) return toObject(data);
    return null;
  }

  Future<void> update({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef = collectionRef.doc(id);
    await docRef.update(data..remove('created_at'));
  }

  Future<void> set({
    required String? id,
    required T data,
  }) async {
    DocumentReference<Map<String, dynamic>> docRef = collectionRef.doc(id);
    try {
      await docRef.update(data.toJson()..remove('created_at'));
    } catch (e) {
      if (e is FirebaseException) {
        switch (e.code) {
          case "not-found":
            await docRef.set(data.toJson());
            break;
          default:
        }
      }
    }
  }

  Future<void> delete({required String id}) async {
    DocumentReference<Map<String, dynamic>> docRef = collectionRef.doc(id);
    await docRef.delete();
  }
}
