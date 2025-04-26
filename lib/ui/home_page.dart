import 'package:flame_audio/flame_audio.dart';
import 'package:flame_test_app/ui/good.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FlameAudio.play('magic.mp3');
              showGeneralDialog(
                context: context,
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return GoodPage();
                },
              );
            },
            child: Text("اضغط للفتح ")),
      ),
    );
  }
}
