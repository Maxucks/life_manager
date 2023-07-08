import 'dart:ui';

class Palette {
  const Palette({
    required this.background,
    required this.foreground,
    required this.status,
    required this.accent,
    required this.text,
  });

  final BackgroundColors background;
  final ForegroundColors foreground;
  final StatusColors status;
  final AccentColors accent;
  final TextColors text;
}

class AccentColors {
  const AccentColors({
    required this.primary,
  });

  final Color primary;
}

class StatusColors {
  const StatusColors({
    required this.positive,
    required this.negative,
  });

  final Color positive;
  final Color negative;
}

class BackgroundColors {
  const BackgroundColors({
    required this.primary,
  });

  final Color primary;
}

class ForegroundColors {
  const ForegroundColors({
    required this.primary,
  });

  final Color primary;
}

class TextColors {
  const TextColors({
    required this.primary,
    required this.secondary,
    required this.primaryInverted,
  });

  final Color primary;
  final Color secondary;

  final Color primaryInverted;
}
