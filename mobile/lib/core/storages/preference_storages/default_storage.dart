import 'package:smart_parking_lot/core/storages/preference_storages/base_storage.dart';
import 'package:smart_parking_lot/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:smart_parking_lot/core/storages/storage_adapters/default_storage_adapter.dart';

abstract class DefaultStorage<T> extends BaseStorage<T> {
  @override
  Future<BaseStorageAdapter<T>> get adapter async => DefaultStorageAdapter<T>();
}
