import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/service_locator/service_locator.dart';
import 'package:life_manager/app/core/ui/exceptions.dart';
import 'package:life_manager/app/salary/application/services/salary_service.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/events.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryState.initial()) {
    on<CalculateSalaryEvent>(_calculateSalaryHandler);
    on<UpdateWeekendsSalaryEvent>(_updateWeekendsHandler);
    on<ToggleHolidaySalaryEvent>(_toggleHolidayHandler);
  }

  Future<void> _calculateSalaryHandler(
    CalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) async {
    try {
      // TODO: fix DI
      final service = sl<SalaryService>();

      final date = event.date ?? DateTime.now();
      final constraints = state.constraints ?? await service.getConstraints();
      final calculation = service.getSalary(date, constraints);

      emit(state.copyWith(
        currentDate: date,
        constraints: constraints,
        calculation: calculation,
      ));
    } catch (e) {
      log(e.toString(), name: "SalaryBloc._calculateSalaryHandler");
    }
  }

  void _updateWeekendsHandler(
    UpdateWeekendsSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    try {
      // TODO: fix DI
      final service = sl<SalaryService>();

      if (state.constraints == null) {
        throw UINoDataException(
          "state.constraints",
          "SalaryBloc._updateWeekendsHandler",
        );
      }

      final updated =
          service.updateWeekends(event.weekends, state.constraints!);
      final updatedConstraints = state.constraints!.copyWith(weekends: updated);

      emit(state.copyWith(constraints: updatedConstraints));
      add(CalculateSalaryEvent());
    } catch (e) {
      log(e.toString(), name: "SalaryBloc._updateWeekendsHandler");
    }
  }

  void _toggleHolidayHandler(
    ToggleHolidaySalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    try {
      // TODO: fix DI
      final service = sl<SalaryService>();

      if (state.constraints == null) {
        throw UINoDataException(
          "state.constraints",
          "SalaryBloc._updateWeekendsHandler",
        );
      }

      final updated = service.toggleHoliday(event.date, state.constraints!);
      final updatedConstraints = state.constraints!.copyWith(holidays: updated);

      emit(state.copyWith(constraints: updatedConstraints));
      add(CalculateSalaryEvent());
    } catch (e) {
      log(e.toString(), name: "SalaryBloc._toggleHolidayHandler");
    }
  }
}
