import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/salary/blocs/salary/events.dart';
import 'package:life_manager/app/salary/blocs/salary/state.dart';
import 'package:life_manager/app/salary/utils/calendar_manager.dart';
import 'package:life_manager/app/salary/utils/salary_manager/salary_manager.dart';
import 'package:life_manager/app/salary/utils/salary_manager/tax_calculator.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryState.initial()) {
    on<CalculateSalaryEvent>(_calculateSalaryHandler);
    on<SetupSalaryCalendarEvent>(_setupCalendarHandler);
    on<SetupSalaryCalculatorEvent>(_setupCalculatorHandler);
    on<SetupAndCalculateSalaryEvent>(_setupAndCalculateHandler);
    on<UpdateWeekendsSalaryEvent>(_updateWeekendsHandler);
    on<ToggleHolidaySalaryEvent>(_toggleHolidayHandler);
  }

  void _setupCalendarHandler(
    SetupSalaryCalendarEvent event,
    Emitter<SalaryState> emit,
  ) {
    final date = event.date ?? DateTime.now();

    final range = CalendarManager.createRangeFromBoundaries(
      date: date,
      boundaries: state.config.boundaries,
      middleDay: state.config.middleDay,
    );

    final daysTillSalary = CalendarManager.daysLeftTillSalary(
      date: date,
      range: range,
    );

    emit(state.copyWith(
      calendar: state.calendar.copyWith(
        currentDate: date,
        daysLeft: daysTillSalary,
        range: range,
      ),
    ));
  }

  void _setupCalculatorHandler(
    SetupSalaryCalculatorEvent event,
    Emitter<SalaryState> emit,
  ) {
    final (year, month, isPrepayment) = CalendarManager.partitonInfo(
      date: state.calendar.currentDate,
      boundaries: state.config.boundaries,
    );

    emit(state.copyWith(
      calendar: state.calendar.copyWith(
        month: month,
        year: year,
        isPrepayment: isPrepayment,
      ),
    ));
  }

  void _calculateSalaryHandler(
    CalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    const salaryManager = SalaryManager(
      taxCalculator: NDFLCalculator(),
    );

    final salaryCalculation = salaryManager.calculateByRange(
      rate: state.config.rate,
      hpdContract: state.config.hpdContract,
      hpdNorm: state.config.hpdNorm,
      middleDay: state.config.middleDay,
      weekends: state.config.weekends,
      holidays: state.config.holidays,
      year: state.calendar.year,
      month: state.calendar.month,
      range: CalendarManager.createFullMonthRange(
        state.calendar.range.first,
      ),
    );

    emit(state.copyWith(
      calculation: salaryCalculation,
    ));
  }

  void _setupAndCalculateHandler(
    SetupAndCalculateSalaryEvent event,
    Emitter<SalaryState> emit,
  ) {
    add(SetupSalaryCalendarEvent(date: event.date));
    add(SetupSalaryCalculatorEvent());
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
