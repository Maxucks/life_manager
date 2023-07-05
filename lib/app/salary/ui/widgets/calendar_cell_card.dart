import 'package:flutter/material.dart';
import 'package:life_manager/app/core/utils/constants.dart';
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
    this.selectedColor = AppColors.primary,
    this.textColor,
  });

  final DateTime date;
  final CalendarCellType type;
  final bool selected;
  final bool disabled;
  final double size;
  final Color selectedColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final color = textColor ??
        (selected
            ? Colors.white
            : disabled
                ? Colors.grey
                : Colors.black);

    final bgColor = selected ? selectedColor : Colors.white;

    final fontWeigth = selected ? FontWeight.w600 : FontWeight.w400;

    final content = Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
        selectedColor.withOpacity(0.1),
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
