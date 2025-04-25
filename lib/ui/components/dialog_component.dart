import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DialogComponent extends StatelessWidget {
  const DialogComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 347,
          height: 430,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: AppColor.kPrimaryColor, offset: Offset(0, 8)),
              BoxShadow(color: AppColor.kThirtColor, offset: Offset(0, -6))
            ],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(300, 50),
              top: Radius.elliptical(300, 100),
            ),
            color: Color(0xff2b9e91),
            border: Border.all(color: AppColor.kfivedColor, width: 15),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(300, 100),
                    bottom: Radius.elliptical(50, 30)),
                color: AppColor.kThirtColor,
              ),
              width: 340,
              height: 390,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -15,
                    left: 60,
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(200, 300)),
                        color: Color(0xff2b9e91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
