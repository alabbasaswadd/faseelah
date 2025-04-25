import 'package:flame_test_app/core/constants/colors.dart';
import 'package:flame_test_app/core/constants/images.dart';
import 'package:flame_test_app/ui/stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VoiceAnswerPage extends StatelessWidget {
  const VoiceAnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F6F9),
      appBar: AppBar(
        elevation: 4,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.kPrimaryColor, AppColor.kSecondColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTopItem(AppImage.bubble, "06/10", AppImage.bubble2),
            Container(
              width: 80,
              height: 57,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: OverflowBox(
                  maxHeight: 150,
                  maxWidth: 90,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AppImage.charectarGif,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _buildTopItem(
                AppImage.bubble, "6010", AppImage.bubble2, AppImage.star),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomStepperWidget(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        SvgPicture.asset(AppImage.bubble3),
                        Positioned(
                          right: 40,
                          left: 20,
                          top: 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "ضَع عَلامَة (✔) لِلجَوابِ الصَّحيح،\n"
                                  "وَعَلامَة (✘) لِلجَوابِ الخَطأ طِبقًا لِما تَسمَع",
                                  style: const TextStyle(
                                    height: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Tajawal",
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppColor.kPrimaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Transform.rotate(
                                  angle: 3.14159,
                                  child: const Icon(Icons.volume_up_outlined,
                                      color: Colors.white, size: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      const SizedBox(width: 96, height: 220),
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          AppImage.charectarGif,
                          height: 220,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  5,
                  (index) => _buildAudioItem(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopItem(String leftImage, String value, String rightImage,
      [String? star]) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.kSecondColor,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Positioned(
          left: -15,
          top: -6,
          child: Image.asset(leftImage, width: 35, height: 35),
        ),
        Positioned(
          right: -20,
          top: -6,
          child: Image.asset(rightImage, width: 35, height: 35),
        ),
        if (star != null && star.isNotEmpty)
          Positioned(
            right: -20,
            top: -8,
            child: Image.asset(star, width: 35, height: 35),
          ),
      ],
    );
  }

  Widget _buildAudioItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.1416),
            child: SvgPicture.asset(
              AppImage.voice,
              color: AppColor.kPrimaryColor,
            ),
          ),
          Positioned.fill(
            left: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  circleContainer(
                      child: SvgPicture.asset(AppImage.mistake, width: 26)),
                  circleContainer(
                      child: SvgPicture.asset(AppImage.correct, width: 26)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        7,
                        (index) =>
                            const Icon(Icons.graphic_eq, color: Colors.white),
                      ),
                    ),
                  ),
                  circleContainer(
                    child: const Icon(Icons.play_arrow,
                        color: AppColor.kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget circleContainer({Widget? child}) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
