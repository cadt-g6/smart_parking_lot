library home;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:smart_parking_lot/core/base/view_model_provider.dart';
import 'package:smart_parking_lot/core/constants/config_constant.dart';
import 'package:smart_parking_lot/core/extensions/color_scheme_extension.dart';
import 'package:smart_parking_lot/core/https/firestore/models/availibility_model.dart';
import 'package:smart_parking_lot/core/https/firestore/models/park_model.dart';
import 'package:smart_parking_lot/gen/assets.gen.dart';
import 'package:smart_parking_lot/providers/theme_provider.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';
import 'package:smart_parking_lot/views/home/home_view_model.dart';
import 'package:smart_parking_lot/views/home/local_widgets/park_sign.dart';
import 'package:smart_parking_lot/views/home/local_widgets/vertical_road.dart';
import 'dart:math' as math;

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
