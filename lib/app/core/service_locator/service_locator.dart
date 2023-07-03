import 'package:get_it/get_it.dart';
import 'package:life_manager/app/salary/services/salary_calendar_service.dart';
import 'package:life_manager/app/salary/services/salary_service.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  _registerService<SalaryCalendarService>(
    () => const SalaryCalendarService(),
  );
  _registerService<SalaryService>(
    () => const SalaryService(
      taxCalculator: NDFLCalculator(),
    ),
  );
}

void _registerService<T extends Object>(T Function() create) {
  if (sl.isRegistered<T>()) {
    sl.unregister<T>();
  }
  sl.registerLazySingleton<T>(create);
}
