import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_provider.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:life_manager/app/core/ui/theme/bloc/theme_state.dart';
import 'package:life_manager/app/core/ui/theme/dark_theme.dart';
import 'package:life_manager/app/core/ui/theme/light_theme.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';
import 'package:life_manager/app/salary/ui/blocs/salary/bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => context.injector.obtain<ThemeBloc>()),
          BlocProvider(create: (_) => context.injector.obtain<SalaryBloc>()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ThemeProvider(
              theme:
                  state.isLightTheme ? const LightTheme() : const DarkTheme(),
              child: const SalaryScreen(),
            );
          },
        ),
      ),
    );
  }
}
