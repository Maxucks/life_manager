import 'dart:developer';

import 'package:life_manager/app/core/serializer/json_app_serializer.dart';
import 'package:life_manager/app/core/storage/app_storage.dart';
import 'package:life_manager/app/salary/application/services/salary_repository.dart';
import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';

class StorageSalaryRepository implements SalaryRepository {
  const StorageSalaryRepository({
    required this.source,
    required this.serializer,
  });

  final AppStorage source;
  final JsonAppSerializer serializer;

  @override
  Future<SalaryConstraints> loadConstraints() async {
    try {
      final initialState = SalaryConstraints.initial();
      final initialJson = await serializer.encode(initialState.toJson);

      final json = await source.loadOrInit(
        SalaryConstraints.storageKey,
        initialJson,
      );
      final constraints = await serializer.decode(
        SalaryConstraints.fromJson,
        json,
      );

      return constraints;
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
      rethrow;
    }
  }

  @override
  Future<void> saveConstraints(SalaryConstraints constraints) async {
    try {
      final json = await serializer.encode(constraints.toJson);
      return source.save(SalaryConstraints.storageKey, json);
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
      rethrow;
    }
  }
}
