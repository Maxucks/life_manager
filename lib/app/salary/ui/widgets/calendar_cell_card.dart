import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/core/utils/date_time_utils.dart';

enum CalendarCellType { weekday, number, weekdayWithNumber }

class CalendarCellCard extends StatelessWidget {
  const CalendarCellCard({
    super.key,
    required this.date,
    this.type = CalendarCellType.weekdayWithNumber,
    this.selected = false,
    this.size = 50,
    this.disabled = false,
    this.border = false,
    this.selectedColor,
    this.textColor,
  });

  final DateTime date;
  final CalendarCellType type;
  final bool selected;
  final bool disabled;
  final double size;
  final bool border;
  final Color? selectedColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final usedSelectedColor =
        selectedColor ?? context.theme.palette.accent.primary;

    final Color color = textColor ??
        (selected
            ? context.theme.palette.text.primaryInverted
            : disabled
                ? context.theme.palette.text.secondary
                : context.theme.palette.text.primary);

    final bgColor =
        selected ? usedSelectedColor : context.theme.palette.foreground.primary;

    final fontWeigth = selected ? FontWeight.w600 : FontWeight.w400;

    final content = Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: border ? Border.all(width: 2, color: usedSelectedColor) : null,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (type == CalendarCellType.number ||
              type == CalendarCellType.weekdayWithNumber)
            Text(
              date.day.toString(),
              style: TextStyle(
                color: color,
                fontWeight: fontWeigth,
              ),
            ),
          if (type == CalendarCellType.weekday ||
              type == CalendarCellType.weekdayWithNumber)
            Text(
              date.weekdayName,
              style: TextStyle(
                color: color,
                fontWeight: fontWeigth,
              ),
            ),
        ],
      ),
    );

    if (selected) {
      final filter = ColorFilter.mode(
        usedSelectedColor.withOpacity(0.1),
        BlendMode.srcATop,
      );
      return ColorFiltered(
        colorFilter: filter,
        child: content,
      );
    }

    return content;
  }
}
