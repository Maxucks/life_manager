import 'dart:async';

abstract class Injector<I> {
  const Injector({
    required this.i,
  });

  final I i;

  T obtain<T extends Object>();
}

abstract class InjectComposer<I extends Injector> {
  const InjectComposer(this.injector);

  final I injector;

  Future<void> compose();
}

typedef ComposerFactory<I extends Injector> = InjectComposer<I> Function(I i);

class MultiInjectComposer<I extends Injector> extends InjectComposer<I> {
  const MultiInjectComposer(super.injector, {required this.factories});

  final List<ComposerFactory<I>> factories;

  @override
  Future<void> compose() async {
    for (var composerFactory in factories) {
      final composer = composerFactory(injector);
      await composer.compose();
    }
  }
}
