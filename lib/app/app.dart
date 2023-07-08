import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/ui/bloc/theme_bloc.dart';
import 'package:life_manager/app/core/ui/bloc/theme_state.dart';
import 'package:life_manager/app/core/ui/theme/light_theme.dart';
import 'package:life_manager/app/core/ui/theme/theme_provider.dart';
import 'package:life_manager/app/salary/ui/screens/salary_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life manager app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ThemeProvider(
            theme: state.isLightTheme ? const LightTheme() : const LightTheme(),
            child: const SalaryScreen(),
          );
        },
      ),
    );
  }
}
