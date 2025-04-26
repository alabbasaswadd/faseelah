import 'package:flutter/material.dart';
import 'package:flame_test_app/core/constants/images.dart';

class GoodPage extends StatelessWidget {
  const GoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // شفافية الخلفية
      body: Center(
        child: Image.asset(
          AppImage.good,
          width: 392,
          height: 172,
        ),
      ),
    );
  }
}
