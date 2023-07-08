import 'package:flutter/widgets.dart';
import 'package:life_manager/app/core/ui/theme/core/app_theme.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  final AppTheme theme;

  static ThemeProvider? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  static ThemeProvider of(BuildContext context) {
    final themeProvider = _maybeOf(context);
    assert(themeProvider != null, 'No ThemeProvider found in context');
    return themeProvider!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => oldWidget.theme != theme;
}
