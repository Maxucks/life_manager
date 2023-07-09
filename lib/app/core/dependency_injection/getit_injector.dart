import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:life_manager/app/core/dependency_injection/injector/inject_composer.dart';

class GetitInjector extends Injector<GetIt> {
  const GetitInjector({
    required super.i,
  });

  @override
  T obtain<T extends Object>() => i<T>();

  void registerFactory<T extends Object>(
    T Function(GetitInjector i) factoryFunc, {
    String? instanceName,
    FutureOr<dynamic> Function(T)? disposingFunction,
  }) {
    if (i.isRegistered<T>(instanceName: instanceName)) {
      i.unregister<T>(
        instanceName: instanceName,
        disposingFunction: disposingFunction,
      );
    }
    i.registerFactory(() => factoryFunc(this), instanceName: instanceName);
  }
}
