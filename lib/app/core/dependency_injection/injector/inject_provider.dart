import 'package:flutter/material.dart';
import 'package:life_manager/app/core/dependency_injection/getit_injector.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_composer.dart';

class InjectProvider<T extends Injector> extends InheritedWidget {
  const InjectProvider({
    super.key,
    required this.composer,
    required super.child,
  });

  final InjectComposer<T> composer;

  static InjectProvider<T>? _maybeOf<T extends Injector>(
    BuildContext context,
  ) {
    return context.dependOnInheritedWidgetOfExactType<InjectProvider<T>>();
  }

  static InjectProvider<T> of<T extends Injector>(BuildContext context) {
    final injectProvider = _maybeOf<T>(context);
    assert(injectProvider != null, 'No InjectProvider<$T> found in context');
    return injectProvider!;
  }

  @override
  bool updateShouldNotify(InjectProvider oldWidget) =>
      oldWidget.composer != composer;
}

extension InjectUtils on BuildContext {
  GetitInjector get injector =>
      InjectProvider.of<GetitInjector>(this).composer.injector;
}
