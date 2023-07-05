import 'package:life_manager/app/salary/domain/models/salary_constraints/salary_constraints.dart';

abstract interface class SalaryRepository {
  Future<SalaryConstraints> loadConstraints();

  Future<void> saveConstraints(SalaryConstraints constraints);
}
