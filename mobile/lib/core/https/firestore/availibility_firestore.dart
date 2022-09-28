import 'package:smart_parking_lot/core/https/firestore/base_cloud_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/models/availibility_model.dart';

class AvailibilityFirestore extends BaseCloudFirestore<AvailibilityModel> {
  @override
  String get collectionName => "availibility";

  @override
  Future<AvailibilityModel> toObject(Map<String, dynamic> json) async {
    return AvailibilityModel.fromJson(json);
  }

  @override
  AvailibilityModel toObjectAsync(Map<String, dynamic> json) {
    return AvailibilityModel.fromJson(json);
  }
}
