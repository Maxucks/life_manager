import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/app_theme.dart';
import 'package:life_manager/app/core/ui/theme/core/palette.dart';

class DarkTheme implements AppTheme {
  const DarkTheme();

  @override
  final Palette palette = const Palette(
    background: BackgroundColors(
      primary: Color(0xFF1E1E1E),
    ),
    foreground: ForegroundColors(
      primary: Color(0xFF242424),
    ),
    status: StatusColors(
      positive: Color(0xFF59AD45),
      negative: Color(0xFFFF4444),
    ),
    accent: AccentColors(
      primary: Color(0xFFE49F37),
    ),
    text: TextColors(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFF6C6C6C),
      primaryInverted: Color(0xFFFFFFFF),
    ),
  );
}
