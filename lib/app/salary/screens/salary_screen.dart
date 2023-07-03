import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/blocs/salary/events.dart';
import 'package:life_manager/app/salary/blocs/salary/state.dart';
import 'package:life_manager/app/salary/widgets/horizontal_calendar/horizontal_calendar.dart';
import 'package:life_manager/app/salary/widgets/income_card.dart';
import 'package:life_manager/app/salary/widgets/info_card.dart';
import 'package:life_manager/app/salary/widgets/selectable_week.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({
    super.key,
  });

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<SalaryBloc>();
    bloc.add(CalculateSalaryEvent());
  }

  void _updateWeekends(Set<int> weekends) {
    final bloc = context.read<SalaryBloc>();
    bloc.add(UpdateWeekendsSalaryEvent(weekends));
  }

  void _toggleHoliday(DateTime date) {
    final bloc = context.read<SalaryBloc>();
    bloc.add(ToggleHolidaySalaryEvent(date));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryBloc, SalaryState>(
      builder: (context, state) {
        final displayMonth = monthName(state.calculation.salaryMonth);
        final displayYear = state.calculation.salaryYear;

        final isPrepayment = state.calculation.isPrepayment;
        final displayDaysLeft = state.calculation.daysLeft;
        final displayHalf = isPrepayment ? "prepayment" : "salary";

        final displayHpdContract = state.constraints.hpdContract.toInt();
        final displayHpdNorm = state.constraints.hpdContract.toInt();

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 80),
                  HorizontalCalendar(
                    onDoubleTap: _toggleHoliday,
                    date: state.currentDate,
                    range: state.calculation.calendarRange,
                    holidays: state.constraints.holidays,
                    weekends: state.constraints.weekends,
                    whetherActive: (date) {
                      final midDay = state.constraints.middleDay;
                      final lastDay = state.calculation.salaryLastDay;

                      return state.calculation.isPrepayment
                          ? date.day <= midDay
                          : date.day > midDay && date.day <= lastDay;
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSection(
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
                                  income: state.calculation.dayCost,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: IncomeCard(
                                  title: "Hour",
                                  income: state.calculation.hourCost,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          IncomeCard(
                            emphasized: isPrepayment,
                            title: "Prepayment",
                            income: state.calculation.prepayment,
                            fractionDigits: 2,
                          ),
                          const SizedBox(height: 12),
                          IncomeCard(
                            emphasized: !isPrepayment,
                            title: "Salary",
                            income: state.calculation.salary,
                            fractionDigits: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ]),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSection(
                      title: "General salary info",
                      body: Column(
                        children: [
                          const InfoCard(
                            leftText: "Work shedule",
                            rightText: "5/2",
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: IncomeCard(
                                  type: IncomeCardType.info,
                                  title: "Rate",
                                  income: state.constraints.rate,
                                  editable: true,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: IncomeCard(
                                  type: IncomeCardType.info,
                                  title: "Rate - %",
                                  income: state.calculation.total,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          InfoCard(
                            leftText: "Prepayment day",
                            rightText: "${state.constraints.boundaries.$2}th",
                            editable: true,
                          ),
                          const SizedBox(height: 12),
                          InfoCard(
                            leftText: "Salary day",
                            rightText: "${state.constraints.boundaries.$1}th",
                            editable: true,
                          ),
                          const SizedBox(height: 12),
                          InfoCard(
                            leftText: "Middle day",
                            rightText: "${state.constraints.middleDay}th",
                            editable: true,
                          ),
                          const SizedBox(height: 12),
                          InfoCard(
                            leftText: "Hours rate",
                            rightText:
                                "${displayHpdContract}h/${displayHpdNorm}h",
                            editable: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSection(
                      title: "Days off",
                      body: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectableWeek(
                            initialData: state.constraints.weekends,
                            onChange: _updateWeekends,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection({
    required String title,
    required Widget body,
    String? trailing,
  }) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: style),
              if (trailing != null) Text(trailing, style: style),
            ],
          ),
        ),
        const SizedBox(height: 8),
        body,
      ],
    );
  }
}
