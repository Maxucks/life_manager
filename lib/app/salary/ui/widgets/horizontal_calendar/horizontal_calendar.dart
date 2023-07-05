import 'package:flutter/material.dart';
import 'package:life_manager/app/core/utils/constants.dart';
import 'package:life_manager/app/salary/ui/widgets/horizontal_calendar/horizontal_calendar_cell.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({
    super.key,
    required this.date,
    required this.range,
    this.cellSize = 64,
    this.whetherActive,
    this.weekends,
    this.holidays,
    this.onDoubleTap,
  });

  final DateTime date;
  final List<DateTime> range;

  final Set<int>? weekends;
  final Set<DateTime>? holidays;

  final bool Function(DateTime date)? whetherActive;
  final Function(DateTime date)? onDoubleTap;

  final double cellSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: cellSize,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: range.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) {
              final item = range[index];
              final active = whetherActive?.call(item) ?? true;

              final isWeekend = weekends?.contains(item.weekday) ?? false;
              final isHoliday = holidays?.contains(item) ?? false;

              final hasDot = active && !(isWeekend || isHoliday);

              Color? textColorOverride;
              if (active) {
                if (isWeekend) {
                  textColorOverride = Colors.grey;
                } else if (isHoliday) {
                  textColorOverride = AppColors.negative;
                }
              }

              return GestureDetector(
                onDoubleTap:
                    onDoubleTap != null ? () => onDoubleTap!(item) : null,
                child: HorizontalCalendarCell(
                  maxSize: cellSize,
                  date: item,
                  selected: item.day == date.day &&
                      item.month == date.month &&
                      item.year == date.year,
                  active: active,
                  dot: hasDot,
                  textColor: textColorOverride,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
