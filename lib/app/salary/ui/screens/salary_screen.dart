import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_events.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_state.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/events.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/state.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_calendar.dart';
import 'package:life_manager/app/salary/ui/screens/widgets/salary_screen_content.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.palette.background.primary,
      body: BlocBuilder<SalaryBloc, SalaryState>(
        builder: (context, state) {
          if (state.constraints == null) {
            return const Center(
              child: Text("Constraints are null"),
            );
          }

          if (state.calculation == null) {
            return const Center(
              child: Text("Calculation is null"),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 16,
                  right: 16,
                  bottom: 6,
                ),
                sliver: SliverToBoxAdapter(
                  child: BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Dark mode",
                            style: TextStyle(
                              color: context.theme.palette.text.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Switch(
                            activeColor: context.theme.palette.accent.primary,
                            inactiveThumbColor:
                                context.theme.palette.text.primary,
                            inactiveTrackColor: Colors.transparent,
                            value: !state.isLightTheme,
                            onChanged: (value) {
                              final bloc = context.read<ThemeBloc>();
                              bloc.add(SwitchThemeEvent());
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SalaryScreenCalendar(
                currentDate: state.currentDate,
                calculation: state.calculation!,
                constraints: state.constraints!,
              ),
              SalaryScreenContent(
                calculation: state.calculation!,
                constraints: state.constraints!,
              ),
            ],
          );
        },
      ),
    );
  }
}
