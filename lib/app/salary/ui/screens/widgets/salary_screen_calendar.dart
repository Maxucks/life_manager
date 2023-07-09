import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/domain/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/events.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_section.dart';
import 'package:life_manager/app/salary/ui/widgets/horizontal_calendar/horizontal_calendar.dart';
import 'package:life_manager/app/salary/ui/widgets/income_card.dart';

class SalaryScreenCalendar extends StatelessWidget {
  const SalaryScreenCalendar({
    super.key,
    required this.currentDate,
    required this.calculation,
    required this.constraints,
  });

  final DateTime currentDate;
  final SalaryConstraints constraints;
  final SalaryCalculation calculation;

  void _toggleHoliday(BuildContext context, DateTime date) {
    final bloc = context.read<SalaryBloc>();
    bloc.add(ToggleHolidaySalaryEvent(date));
  }

  bool _isActive(DateTime date) =>
      date.day <= calculation.salaryLastDay &&
      date.month == calculation.salaryMonth &&
      date.year == calculation.salaryYear;

  bool _hasDot(DateTime date) {
    final isTimeOff = constraints.weekends.contains(date.weekday) ||
        constraints.holidays.contains(date);

    final isCurrentMonth = date.month == calculation.salaryMonth &&
        date.year == calculation.salaryYear;

    final dayIsActive = calculation.isPrepayment
        ? date.day <= constraints.middleDay
        : date.day > constraints.middleDay &&
            date.day <= calculation.salaryLastDay;

    return !isTimeOff && isCurrentMonth && dayIsActive;
  }

  bool _hasBorder(DateTime date) {
    final isCurrentMonth = calculation.isPrepayment
        ? date.month == calculation.salaryMonth
        : date.month > calculation.salaryMonth;

    final isSalary = calculation.isPrepayment
        ? date.day == constraints.boundaries.$2
        : date.day == constraints.boundaries.$1;

    return isCurrentMonth && isSalary;
  }

  @override
  Widget build(BuildContext context) {
    final displayMonth = monthName(calculation.salaryMonth);
    final displayYear = calculation.salaryYear;

    final isPrepayment = calculation.isPrepayment;
    final displayDaysLeft = calculation.daysLeft;
    final displayHalf = isPrepayment ? "prepayment" : "salary";

    return SliverList(
      delegate: SliverChildListDelegate([
        HorizontalCalendar(
          onDoubleTap: (date) => _toggleHoliday(context, date),
          date: currentDate,
          range: calculation.calendarRange,
          holidays: constraints.holidays,
          weekends: constraints.weekends,
          whetherActive: _isActive,
          whetherHasDot: _hasDot,
          whetherHasBorder: _hasBorder,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SalaryScreenSection(
            title: "$displayMonth $displayYear",
            trailing: "$displayDaysLeft days till $displayHalf",
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: IncomeCard(
                        title: "Day",
                        income: calculation.dayCost,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: IncomeCard(
                        title: "Hour",
                        income: calculation.hourCost,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                IncomeCard(
                  emphasized: isPrepayment,
                  title: "Prepayment",
                  income: calculation.prepayment,
                  fractionDigits: 2,
                ),
                const SizedBox(height: 12),
                IncomeCard(
                  emphasized: !isPrepayment,
                  title: "Salary",
                  income: calculation.salary,
                  fractionDigits: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
