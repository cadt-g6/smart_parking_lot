import 'package:flutter/material.dart';
import 'package:smart_parking_lot/core/constants/config_constant.dart';
import 'package:smart_parking_lot/theme/m3/m3_color.dart';
import 'dart:math' as math;

class ParkSign extends StatelessWidget {
  const ParkSign({
    Key? key,
    required this.name,
    required this.left,
  }) : super(key: key);

  final String name;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()..translate(left ? -18.0 : 18.0, left ? -8.0 : -24.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: ConfigConstant.circlarRadius1,
                  color: M3Color.of(context).error,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5,
                      color: Colors.black45,
                    ),
                  ],
                ),
                child: Text(
                  name,
                  style: TextStyle(color: M3Color.of(context).onError),
                ),
              ),
              Container(
                width: 1,
                height: 16,
                color: M3Color.of(context).onBackground,
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              transform: Matrix4.identity()..translate(-8.0, 0.0),
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  width: 1,
                  height: 8,
                  decoration: BoxDecoration(
                    color: M3Color.of(context).onBackground,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
