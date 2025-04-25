import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class CustomStepperWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CustomStepperWidget({
    super.key,
    this.currentStep = 1,
    this.totalSteps = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customContainer(
            color: AppColor.kPrimaryColor,
            icon: Icons.info_outline,
            iconColor: Colors.white,
          ),
          SizedBox(
            width: totalSteps * 46,
            child: Row(
              children: List.generate(
                totalSteps,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 7,
                  width: 36,
                  decoration: BoxDecoration(
                    color: index <= currentStep
                        ? AppColor.kSecondColor
                        : Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          customContainer(color: Colors.white, icon: Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

Widget customContainer({Color? color, IconData? icon, Color? iconColor}) {
  return Container(
    width: 40,
    height: 40,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Icon(
      icon,
      color: iconColor,
    ),
  );
}
