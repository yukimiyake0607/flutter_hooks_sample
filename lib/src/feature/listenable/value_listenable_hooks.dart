import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ValueListenableHooks extends HookConsumerWidget {
  const ValueListenableHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 自動でdispose
    final counterNotifier = useState(ValueNotifier<int>(0));

    // ✅ useValueListenable: 値を直接取得
    final counterValue = useValueListenable(counterNotifier.value);

    void increment() {
      counterNotifier.value.value++;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版 (useValueListenable)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'useValueListenableを使用:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // ✅ 値を直接使える（最もシンプル）
            Text(
              '$counterValue',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: increment, child: const Text('カウント+1')),
          ],
        ),
      ),
    );
  }
}
