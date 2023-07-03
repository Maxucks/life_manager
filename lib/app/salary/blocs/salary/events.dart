abstract class SalaryEvent {}

class CalculateSalaryEvent extends SalaryEvent {
  CalculateSalaryEvent({
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
