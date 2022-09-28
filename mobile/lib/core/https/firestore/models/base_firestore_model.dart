abstract class BaseFirestoreModel {
  // ISO format
  final String createdAt;
  final String updatedAt;
  final String id;

  BaseFirestoreModel(
    this.createdAt,
    this.updatedAt,
    this.id,
  );

  Map<String, dynamic> toJson();
}
