library home;

import 'package:flutter/material.dart';
import 'package:smart_parking_lot/core/base/view_model_provider.dart';
import 'package:smart_parking_lot/views/home/home_view_model.dart';

part 'home_adaptive.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      onModelReady: (context, viewModel) {},
      builder: (context, viewModel, child) {
        return _HomeAdaptive(viewModel);
      },
    );
  }
}
