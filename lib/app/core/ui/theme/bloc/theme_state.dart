import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';
part 'theme_state.g.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required bool isLightTheme,
  }) = _ThemeState;

  factory ThemeState.initial() {
    return const ThemeState(
      isLightTheme: true,
    );
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}
