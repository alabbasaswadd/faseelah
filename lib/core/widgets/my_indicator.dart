import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class MyIndicator extends StatelessWidget {
  const MyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(color: AppColor.kPrimaryColor);
  }
}
