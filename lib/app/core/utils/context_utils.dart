import 'package:flutter/widgets.dart';
import 'package:life_manager/app/core/ui/theme/core/app_theme.dart';
import 'package:life_manager/app/core/ui/theme/theme_provider.dart';

extension ContextUtils on BuildContext {
  AppTheme get theme => ThemeProvider.of(this).theme;
}
