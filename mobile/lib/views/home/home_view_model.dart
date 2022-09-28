import 'package:smart_parking_lot/core/base/base_view_model.dart';
import 'package:smart_parking_lot/views/home/lot_format.dart';

class HomeViewModel extends BaseViewModel {
  final List<ParkModel> data = LotFormat().parks;
}
