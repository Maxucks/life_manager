import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
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
