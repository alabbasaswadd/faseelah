import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';


class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColor.kPrimaryColor,
      child: Icon(icon),
    );
  }
}
