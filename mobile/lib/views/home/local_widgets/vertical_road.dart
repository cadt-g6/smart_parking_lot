import 'package:flutter/material.dart';
import 'package:smart_parking_lot/core/extensions/color_scheme_extension.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';
import 'dart:math' as math;

class VerticalRoad extends StatelessWidget {
  const VerticalRoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: kToolbarHeight,
      height: double.infinity,
      color: M3Color.of(context).readOnly.surface5,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Transform.rotate(
            angle: math.pi / 2,
            child: Icon(
              Icons.remove,
              color: M3Color.of(context).onSurface.withOpacity(0.25),
            ),
          );
        },
      ),
    );
  }
}
