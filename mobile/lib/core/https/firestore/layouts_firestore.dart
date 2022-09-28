import 'package:smart_parking_lot/core/https/firestore/base_cloud_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/models/layout_model.dart';

class LayoutsFirestore extends BaseCloudFirestore<LayoutModel> {
  @override
  String get collectionName => "layouts";

  @override
  Future<LayoutModel> toObject(Map<String, dynamic> json) async {
    return LayoutModel.fromJson(json);
  }

  @override
  LayoutModel toObjectAsync(Map<String, dynamic> json) {
    return LayoutModel.fromJson(json);
  }
}
