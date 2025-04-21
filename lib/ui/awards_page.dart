import 'package:animate_do/animate_do.dart';
import 'package:flame_test_app/state_manegment/cubit/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flame_test_app/core/constants/images.dart';
import 'package:flame_test_app/state_manegment/cubit/box_cubit.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late BoxCubit box;

  @override
  void initState() {
    box = BoxCubit();
    super.initState();
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }

  Widget buildBox(BoxState state) {
    return Column(
      children: [
        InkWell(
          onTap: box.openBox,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: !state.boxIsOpen
                ? BackInLeft(
                    duration: const Duration(milliseconds: 1500),
                    child: Image.asset(
                      AppImage.closeBox,
                      width: 300,
                    ),
                  )
                : Swing(
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      AppImage.openBox,
                      width: 300,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: state.boxIsOpen ? box.onContinueTap : box.openBox,
            child: Text(
              state.boxIsOpen ? "اضغط للمتابعة" : "اضغط للفتح",
              style: TextStyle(fontFamily: "Tajawal", fontSize: 20),
            ))
      ],
    );
  }

  Widget buildImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(AppImage.coins, height: 70),
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 700),
          child: Image.asset(AppImage.excier, height: 70),
        ),
        FadeInUp(
          duration: const Duration(milliseconds: 900),
          child: Image.asset(AppImage.jewels, height: 70),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BoxCubit, BoxState>(
          bloc: box,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (state.progresIsFinished) Navigator.pop(context);
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 200),
                            if (state.isContentVisible && state.boxIsOpen)
                              buildImages(),
                            if (state.isContentVisible) buildBox(state),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.bounceOut,
                    top: state.playSlideOut ? state.imageTopPosition : 50,
                    left: 0,
                    right: 0,
                    child: Image.asset(AppImage.thanina),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
