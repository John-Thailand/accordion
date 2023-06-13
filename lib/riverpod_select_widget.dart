import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  int count;
  CounterState(this.count);
}

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState(0));

  void increment() {
    state = CounterState(state.count + 1);
  }
}

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CounterState>(
        (ref) => CounterNotifier());

class RiverpodSelectWidget extends ConsumerWidget {
  const RiverpodSelectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEven =
        ref.watch(counterProvider.select((state) => state.count.isEven));
    return Text('Is Even: $isEven');
  }
}
