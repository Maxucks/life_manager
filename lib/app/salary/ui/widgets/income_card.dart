import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/widgets/info_card.dart';

enum IncomeCardType { income, info }

class IncomeCard extends StatelessWidget {
  const IncomeCard({
    super.key,
    required this.title,
    required this.income,
    this.type = IncomeCardType.income,
    this.fractionDigits = 0,
    this.emphasized = false,
    this.showCurrency = true,
    this.editable = false,
  });

  final String title;
  final double income;
  final IncomeCardType type;
  final bool emphasized;
  final int fractionDigits;
  final bool showCurrency;
  final bool editable;

  String get _incomeString {
    final sign = type == IncomeCardType.income ? (income >= 0 ? "+" : "-") : "";
    final formattedIncome = income.abs().toStringAsFixed(fractionDigits);
    return "$sign$formattedIncome${showCurrency ? "₽" : ""}";
  }

  Color _incomeColor(BuildContext context) => type == IncomeCardType.income
      ? (income >= 0
          ? context.theme.palette.status.positive
          : context.theme.palette.status.negative)
      : context.theme.palette.text.primary;

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      leftText: title,
      rightText: _incomeString,
      rightTextColor: _incomeColor(context),
      emphasized: emphasized,
      editable: editable,
    );
  }
}
