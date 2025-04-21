import 'package:flame_audio/flame_audio.dart';
import 'package:flame_test_app/state_manegment/cubit/box_cubit.dart';
import 'package:flame_test_app/ui/voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlameAudio.audioCache.loadAll([
    'open-box.mp3',
    'magic.mp3',
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoxCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: VoiceAnswerPage(),
      ),
    );
  }
}
