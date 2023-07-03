import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/service_locator/service_locator.dart';
import 'package:life_manager/app/salary/blocs/salary/events.dart';
import 'package:life_manager/app/salary/blocs/salary/state.dart';
import 'package:life_manager/app/salary/services/salary_service.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryState.initial()) {
    on<CalculateSalaryEvent>(_calculateSalaryHandler);
    on<UpdateWeekendsSalaryEvent>(_updateWeekendsHandler);
    on<ToggleHolidaySalaryEvent>(_toggleHolidayHandler);
  }

  void _calculateSalaryHandler(
    CalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final service = sl<SalaryService>();

    final date = event.date ?? DateTime.now();
    // TODO:
    // final constraints = service.getConstraints();
    final calculation = service.getSalary(date, state.constraints);

    emit(state.copyWith(
      currentDate: date,
      constraints: state.constraints,
      calculation: calculation,
    ));
  }

  void _updateWeekendsHandler(
    UpdateWeekendsSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final service = sl<SalaryService>();

    final updated = service.updateWeekends(event.weekends);
    final updatedConstraints = state.constraints.copyWith(weekends: updated);

    emit(state.copyWith(constraints: updatedConstraints));
    add(CalculateSalaryEvent());
  }

  void _toggleHolidayHandler(
    ToggleHolidaySalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final service = sl<SalaryService>();

    final updated = service.toggleHoliday(event.date);
    final updatedConstraints = state.constraints.copyWith(holidays: updated);

    emit(state.copyWith(constraints: updatedConstraints));
    add(CalculateSalaryEvent());
  }
}
