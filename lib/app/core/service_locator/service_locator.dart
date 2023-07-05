import 'package:get_it/get_it.dart';
import 'package:life_manager/app/core/serializer/isolated_json_serializer.dart';
import 'package:life_manager/app/core/serializer/json_app_serializer.dart';
import 'package:life_manager/app/core/storage/app_storage.dart';
import 'package:life_manager/app/core/storage/shared_prefs_storage.dart';
import 'package:life_manager/app/salary/application/services/salary_repository.dart';
import 'package:life_manager/app/salary/application/services/salary_service.dart';
import 'package:life_manager/app/salary/domain/repositories/storage_salary_repository.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> configureCompositionRoot() async {
  _registerTools();
  await _registerDataSources();
  _registerRepositories();
  _registerServices();
}

void _registerTools() {
  _registerLazy<JsonAppSerializer>(() => const IsolatedJsonSerializer());
}

Future<void> _registerDataSources() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  _registerLazy<AppStorage>(() => SharedPrefsStorage(prefs: prefs));
}

void _registerRepositories() async {
  _registerLazy<SalaryRepository>(
    () => StorageSalaryRepository(
      source: sl<AppStorage>(),
      serializer: sl<JsonAppSerializer>(),
    ),
  );
}

void _registerServices() {
  _registerLazy<SalaryService>(
    () => SalaryService(
      taxCalculator: const NDFLCalculator(),
      repo: sl<SalaryRepository>(),
    ),
  );
}

// Helpers

void _registerLazy<T extends Object>(T Function() create) {
  if (sl.isRegistered<T>()) {
    sl.unregister<T>();
  }
  sl.registerLazySingleton<T>(create);
}
