import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog(
      {super.key,
      required this.onOk,
      required this.onNo,
      required this.title,
      required this.content});
  final Function() onOk;
  final Function() onNo;
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        MaterialButton(
          onPressed: onOk,
          color: AppColor.kPrimaryColor,
          textColor: Colors.white,
          child: Text("Yes"),
        ),
        MaterialButton(
          onPressed: onNo,
          color: Colors.red,
          textColor: Colors.white,
          child: Text("No"),
        ),
      ],
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(content),
    );
  }
}
