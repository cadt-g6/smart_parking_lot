import 'package:smart_parking_lot/core/https/cloud_storage/base_cloud_storage.dart';

class UserFileStorage extends BaseCloudStorage {
  static final UserFileStorage instance = UserFileStorage._();
  UserFileStorage._();

  @override
  String get refPath => "users";
}
