import 'package:bloc/bloc.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_test_app/state_manegment/cubit/box_state.dart';

class BoxCubit extends Cubit<BoxState> {
  BoxCubit() : super(BoxState.initial());

  bool _boxIsOpenToFirstTime = false;

  void openBox() {
    if (!_boxIsOpenToFirstTime) {
      _boxIsOpenToFirstTime = true;
      FlameAudio.play('open-box.mp3');
      emit(state.copyWith(boxIsOpen: true));
    }
  }

  void onContinueTap() {
    emit(state.copyWith(isContentVisible: false));
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(state.copyWith(playSlideOut: true, imageTopPosition: 250));
      Future.delayed(const Duration(milliseconds: 700), onImageDown);
    });
  }

  void onImageDown() {
    emit(state.copyWith(
        playSlideOut: true, imageTopPosition: 250, progresIsFinished: true));
  }
}
