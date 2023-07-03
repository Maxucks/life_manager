import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/app.dart';
import 'package:life_manager/app/core/service_locator/service_locator.dart';
import 'package:life_manager/app/salary/blocs/salary/bloc.dart';

void main() {
  _initApp();

  runApp(
    BlocProvider<SalaryBloc>(
      create: (context) => SalaryBloc(),
      child: const App(),
    ),
  );
}

void _initApp() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
}
