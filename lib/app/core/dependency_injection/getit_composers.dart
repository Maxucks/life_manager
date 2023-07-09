import 'package:get_it/get_it.dart';
import 'package:life_manager/app/core/dependency_injection/getit_injector.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_composer.dart';
import 'package:life_manager/app/core/serializer/isolated_json_serializer.dart';
import 'package:life_manager/app/core/serializer/json_app_serializer.dart';
import 'package:life_manager/app/core/storage/app_storage.dart';
import 'package:life_manager/app/core/storage/shared_prefs_storage.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:life_manager/app/salary/application/services/salary_repository.dart';
import 'package:life_manager/app/salary/application/services/salary_service.dart';
import 'package:life_manager/app/salary/domain/repositories/storage_salary_repository.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
import 'package:life_manager/app/salary/utils/tax_calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

MultiInjectComposer<GetitInjector> createGetitCompositionRoot() {
  return MultiInjectComposer<GetitInjector>(
    GetitInjector(i: GetIt.I),
    factories: [
      (i) => ToolsGetitInjectComposer(i),
      (i) => DataSourcesGetitInjectComposer(i),
      (i) => RepositoriesGetitInjectComposer(i),
      (i) => ServicesGetitInjectComposer(i),
      (i) => BlocsGetitInjectComposer(i),
    ],
  );
}

class ToolsGetitInjectComposer extends InjectComposer<GetitInjector> {
  const ToolsGetitInjectComposer(super.injector);

  @override
  Future<void> compose() async {
    injector.registerFactory<JsonAppSerializer>(
      (_) => const IsolatedJsonSerializer(),
    );
  }
}

class DataSourcesGetitInjectComposer extends InjectComposer<GetitInjector> {
  const DataSourcesGetitInjectComposer(super.injector);

  @override
  Future<void> compose() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    injector.registerFactory<AppStorage>(
      (_) => SharedPrefsStorage(prefs: prefs),
    );
  }
}

class RepositoriesGetitInjectComposer extends InjectComposer<GetitInjector> {
  const RepositoriesGetitInjectComposer(super.injector);

  @override
  Future<void> compose() async {
    injector.registerFactory<SalaryRepository>(
      (i) => StorageSalaryRepository(
        source: i.obtain<AppStorage>(),
        serializer: i.obtain<JsonAppSerializer>(),
      ),
    );
  }
}

class ServicesGetitInjectComposer extends InjectComposer<GetitInjector> {
  const ServicesGetitInjectComposer(super.injector);

  @override
  Future<void> compose() async {
    injector.registerFactory<SalaryService>(
      (i) => SalaryService(
        taxCalculator: const NDFLCalculator(),
        repo: i.obtain<SalaryRepository>(),
      ),
    );
  }
}

class BlocsGetitInjectComposer extends InjectComposer<GetitInjector> {
  const BlocsGetitInjectComposer(super.injector);

  @override
  Future<void> compose() async {
    injector.registerFactory<ThemeBloc>(
      (_) => ThemeBloc(),
    );
    injector.registerFactory<SalaryBloc>(
      (i) => SalaryBloc(
        service: i.obtain<SalaryService>(),
      ),
    );
  }
}
