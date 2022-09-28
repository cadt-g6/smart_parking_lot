import 'package:flutter/material.dart';
import 'package:smart_parking_lot/core/base/base_view_model.dart';
import 'package:smart_parking_lot/core/https/firestore/availibility_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/layouts_firestore.dart';
import 'package:smart_parking_lot/core/https/firestore/models/availibility_model.dart';
import 'package:smart_parking_lot/core/https/firestore/models/park_model.dart';

class HomeViewModel extends BaseViewModel {
  final layoutsFirestore = LayoutsFirestore();
  final availibilityFirestore = AvailibilityFirestore();
  final ValueNotifier<AvailibilityModel?> availibilityNotifier = ValueNotifier(null);
  final ValueNotifier<List<ParkModel>?> parkNotifier = ValueNotifier(null);

  HomeViewModel() {
    layoutsFirestore.streamOne("1").listen((event) {
      parkNotifier.value = event?.data;
    });

    availibilityFirestore.streamOne("1").listen((event) {
      availibilityNotifier.value = event;
    });
  }

  @override
  void dispose() {
    availibilityNotifier.dispose();
    parkNotifier.dispose();
    super.dispose();
  }
}
