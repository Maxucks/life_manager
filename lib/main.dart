import 'package:flutter/material.dart';
import 'package:life_manager/app/app.dart';
import 'package:life_manager/app/core/dependency_injection/getit_composers.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_provider.dart';

void main() async {
  await _initApp();

  final composer = createGetitCompositionRoot();
  await composer.compose();

  runApp(
    InjectProvider(
      composer: composer,
      child: const App(),
    ),
  );
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
}
