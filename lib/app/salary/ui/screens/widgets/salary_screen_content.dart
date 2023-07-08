import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/salary/domain/models/salary_calculation/salary_calculation.dart';
import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/events.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_section.dart';
import 'package:life_manager/app/salary/ui/widgets/income_card.dart';
import 'package:life_manager/app/salary/ui/widgets/info_card.dart';
import 'package:life_manager/app/salary/ui/widgets/selectable_week.dart';

class SalaryScreenContent extends StatelessWidget {
  const SalaryScreenContent({
    super.key,
    required this.calculation,
    required this.constraints,
  });

  final SalaryConstraints constraints;
  final SalaryCalculation calculation;

  void _updateWeekends(BuildContext context, Set<int> weekends) {
    final bloc = context.read<SalaryBloc>();
    bloc.add(UpdateWeekendsSalaryEvent(weekends));
  }

  @override
  Widget build(BuildContext context) {
    final displayHpdContract = constraints.hpdContract.toInt();
    final displayHpdNorm = constraints.hpdNorm.toInt();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          SalaryScreenSection(
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
                        income: constraints.rate,
                        editable: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: IncomeCard(
                        type: IncomeCardType.info,
                        title: "Rate - %",
                        income: calculation.total,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InfoCard(
                  leftText: "Prepayment day",
                  rightText: "${constraints.boundaries.$2}th",
                  editable: true,
                ),
                const SizedBox(height: 12),
                InfoCard(
                  leftText: "Salary day",
                  rightText: "${constraints.boundaries.$1}th",
                  editable: true,
                ),
                const SizedBox(height: 12),
                InfoCard(
                  leftText: "Middle day",
                  rightText: "${constraints.middleDay}th",
                  editable: true,
                ),
                const SizedBox(height: 12),
                InfoCard(
                  leftText: "Hours rate",
                  rightText: "${displayHpdContract}h/${displayHpdNorm}h",
                  editable: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SalaryScreenSection(
            title: "Days off",
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableWeek(
                  initialData: constraints.weekends,
                  onChange: (weekends) => _updateWeekends(context, weekends),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
