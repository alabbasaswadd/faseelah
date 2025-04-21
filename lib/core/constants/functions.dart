import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) =>
        Center(child: SpinKitFadingCircle(color: AppColor.kPrimaryColor)),
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}

void showErrorMessage(String message) {
  Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
}
