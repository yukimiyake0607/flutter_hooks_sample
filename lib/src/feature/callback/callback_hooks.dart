import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/callback/counter_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CallbackHooks extends HookConsumerWidget {
  const CallbackHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);
    final otherValue = useState(0);

    // ✅ useCallback: countが変わらない限り、同じ関数インスタンスを使い回す
    final increment = useCallback(() {
      count.value++;
    }, [count.value]); // countが変わったときだけ新しい関数を作る

    void changeOther() {
      otherValue.value++;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カウント: ${count.value}', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            Text(
              '別の値: ${otherValue.value}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            // ✅ 「別の値を変更」を押しても、incrementは変わらないため
            // CounterButtonは再構築されない（最適化）
            CounterButton(onPressed: increment, label: 'カウント+1'),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: changeOther, child: const Text('別の値を変更')),
            const SizedBox(height: 24),
            const Text(
              '👆「別の値を変更」を押しても\nCounterButtonは再構築されない',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
