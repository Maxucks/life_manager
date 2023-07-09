import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/widgets/horizontal_calendar/horizontal_calendar_cell.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({
    super.key,
    required this.date,
    required this.range,
    this.cellSize = 64,
    this.padSize = 16,
    this.whetherActive,
    this.whetherHasDot,
    this.whetherHasBorder,
    this.weekends,
    this.holidays,
    this.onDoubleTap,
  });

  final double padSize;

  final DateTime date;
  final List<DateTime> range;

  final Set<int>? weekends;
  final Set<DateTime>? holidays;

  final bool Function(DateTime date)? whetherActive;
  final bool Function(DateTime date)? whetherHasDot;
  final bool Function(DateTime date)? whetherHasBorder;

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
              final hasDot = whetherHasDot?.call(item) ?? false;
              final hasBorder = whetherHasBorder?.call(item) ?? false;

              final isWeekend = weekends?.contains(item.weekday) ?? false;
              final isHoliday = holidays?.contains(item) ?? false;

              Color? textColorOverride;
              if (active) {
                if (isWeekend) {
                  textColorOverride = context.theme.palette.text.secondary;
                } else if (isHoliday) {
                  textColorOverride = context.theme.palette.status.negative;
                }
              }

              final widget = GestureDetector(
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
                  border: hasBorder,
                  textColor: textColorOverride,
                ),
              );

              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.only(left: padSize),
                  child: widget,
                );
              }

              if (index == range.length - 1) {
                return Padding(
                  padding: EdgeInsets.only(right: padSize),
                  child: widget,
                );
              }

              return widget;
            },
          ),
        ),
      ],
    );
  }
}
