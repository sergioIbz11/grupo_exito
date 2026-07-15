import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/is_express_window_available_usecase.dart';

part 'express_cart_provider.g.dart';

@riverpod
class ExpressCartEnabled extends _$ExpressCartEnabled {
  @override
  bool build() => false;

  void toggle() => state = !state;
}

@riverpod
Stream<bool> expressWindowAvailable(Ref ref) async* {
  final usecase = GetIt.I<IsExpressWindowAvailableUsecase>();
  yield usecase();
  yield* Stream.periodic(const Duration(minutes: 1), (_) => usecase());
}

@riverpod
bool expressCartActive(Ref ref) {
  final isAvailable = ref.watch(expressWindowAvailableProvider).value ?? false;
  final isEnabled = ref.watch(expressCartEnabledProvider);
  return isAvailable && isEnabled;
}
