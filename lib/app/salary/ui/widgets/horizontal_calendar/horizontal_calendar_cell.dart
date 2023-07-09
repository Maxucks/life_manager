import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/widgets/calendar_cell_card.dart';

class HorizontalCalendarCell extends StatelessWidget {
  const HorizontalCalendarCell({
    super.key,
    required this.date,
    this.selected = false,
    this.dot = false,
    this.active = false,
    this.border = false,
    this.maxSize = 45,
    this.dotSize = 5,
    this.textColor,
  });

  final DateTime date;
  final bool selected;
  final bool dot;
  final double dotSize;
  final bool border;
  final bool active;
  final double maxSize;
  final Color? textColor;

  static const double _gapSize = 8;

  double get _cellSize => maxSize - dotSize - _gapSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarCellCard(
          size: _cellSize,
          date: date,
          type: CalendarCellType.weekdayWithNumber,
          border: border,
          selected: selected,
          disabled: !active,
          textColor: textColor,
        ),
        const SizedBox(height: _gapSize),
        SizedBox(
          width: dotSize,
          height: dotSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: dot
                  ? context.theme.palette.accent.primary
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
