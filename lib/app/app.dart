import 'package:flutter/material.dart';
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
      home: const SalaryScreen(),
    );
  }
}
