import 'package:freezed_annotation/freezed_annotation.dart';
part 'box_state.freezed.dart';

@freezed
class BoxState with _$BoxState {
  factory BoxState.initial({
    @Default(false) bool boxIsOpen,
    @Default(false) bool progresIsFinished,
    @Default(false) bool playSlideOut,
    @Default(true) bool isContentVisible,
    @Default(50) double imageTopPosition,
  }) = _initial;
}
