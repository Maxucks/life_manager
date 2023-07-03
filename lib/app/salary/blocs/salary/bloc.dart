import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/service_locator/service_locator.dart';
import 'package:life_manager/app/core/utils/date_time_utils.dart';
import 'package:life_manager/app/salary/blocs/salary/events.dart';
import 'package:life_manager/app/salary/blocs/salary/state.dart';
import 'package:life_manager/app/salary/services/salary_calendar_service.dart';
import 'package:life_manager/app/salary/services/salary_service.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryState.initial()) {
    on<SetupSalaryEvent>(_setupSalaryHandler);
    on<CalculateSalaryEvent>(_calculateSalaryHandler);
    on<SetupAndCalculateSalaryEvent>(_setupAndCalculateHandler);
    on<UpdateWeekendsSalaryEvent>(_updateWeekendsHandler);
    on<ToggleHolidaySalaryEvent>(_toggleHolidayHandler);
  }

  void _setupSalaryHandler(
    SetupSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final date = event.date ?? DateTime.now();

    final calendarService = sl<SalaryCalendarService>();

    final constraints = calendarService.getConstraints(
      date: date,
      boundaries: state.config.boundaries,
    );
    final range = calendarService.createRangeFromBoundaries(
      date: date,
      boundaries: state.config.boundaries,
      middleDay: state.config.middleDay,
      constraints: constraints,
    );
    final daysTillSalary = calendarService.daysLeftTillSalary(
      date: date,
      range: range,
    );

    emit(state.copyWith(
      calendar: state.calendar.copyWith(
        range: range,
        currentDate: date,
        daysLeft: daysTillSalary,
        constraints: constraints,
      ),
    ));
  }

  void _calculateSalaryHandler(
    CalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final calendarService = sl<SalaryCalendarService>();
    final salaryService = sl<SalaryService>();

    final monthRange = calendarService.createFullMonthRange(
      state.calendar.currentDate,
      state.calendar.constraints,
    );

    final salaryCalculation = salaryService.calculateByRange(
      rate: state.config.rate,
      hpdContract: state.config.hpdContract,
      hpdNorm: state.config.hpdNorm,
      middleDay: state.config.middleDay,
      weekends: state.config.weekends,
      holidays: state.config.holidays,
      year: state.calendar.constraints.year,
      month: state.calendar.constraints.month,
      range: monthRange,
    );

    emit(state.copyWith(
      calculation: salaryCalculation,
    ));
  }

  void _setupAndCalculateHandler(
    SetupAndCalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    add(SetupSalaryEvent(date: event.date));
    add(CalculateSalaryEvent());
  }

  void _updateWeekendsHandler(
    UpdateWeekendsSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(
        weekends: {...event.weekends},
      ),
    ));

    add(CalculateSalaryEvent());
  }

  void _toggleHolidayHandler(
    ToggleHolidaySalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    final weekends = state.config.weekends;
    final holidays = state.config.holidays;
    final date = event.date;

    if (!weekends.contains(date.weekday)) {
      emit(state.copyWith(
        config: state.config.copyWith(
          holidays: holidays.contains(date)
              ? holidays.where((h) => h != date).toList()
              : [...holidays, date],
        ),
      ));

      add(CalculateSalaryEvent());
    }
  }
}
