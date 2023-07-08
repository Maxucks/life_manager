import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/ui/bloc/theme_events.dart';
import 'package:life_manager/app/core/ui/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<SwitchThemeEvent>(_switchThemeBuilder);
  }

  void _switchThemeBuilder(
    SwitchThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(
      isLightTheme: !state.isLightTheme,
    ));
  }
}
