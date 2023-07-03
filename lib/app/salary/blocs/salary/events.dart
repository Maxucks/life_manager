abstract class SalaryEvent {}

class CalculateSalaryEvent extends SalaryEvent {}

class SetupSalaryCalendarEvent extends SalaryEvent {
  SetupSalaryCalendarEvent({
    this.date,
  });

  final DateTime? date;
}

class SetupSalaryCalculatorEvent extends SalaryEvent {}

class SetupAndCalculateSalaryEvent extends SalaryEvent {
  SetupAndCalculateSalaryEvent({
    this.date,
  });

  final DateTime? date;
}

class UpdateWeekendsSalaryEvent extends SalaryEvent {
  UpdateWeekendsSalaryEvent(this.weekends);

  final Set<int> weekends;
}

class ToggleHolidaySalaryEvent extends SalaryEvent {
  ToggleHolidaySalaryEvent(this.date);

  final DateTime date;
}
