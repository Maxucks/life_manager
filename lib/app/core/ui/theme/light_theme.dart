import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/app_theme.dart';
import 'package:life_manager/app/core/ui/theme/core/palette.dart';

class LightTheme implements AppTheme {
  const LightTheme();

  @override
  final Palette palette = const Palette(
    background: BackgroundColors(
      primary: Color(0xFFF3F3F3),
    ),
    foreground: ForegroundColors(
      primary: Color(0xFFFFFFFF),
    ),
    status: StatusColors(
      positive: Color(0xFF67AD5B),
      negative: Color(0xFFE15342),
    ),
    accent: AccentColors(
      primary: Color(0xFFF5C344),
    ),
    text: TextColors(
      primary: Color(0xFF222023),
      secondary: Color(0xFFA7A7A7),
      primaryInverted: Color(0xFFFFFFFF),
    ),
  );
}
