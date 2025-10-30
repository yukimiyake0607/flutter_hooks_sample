import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListenableHooks extends HookConsumerWidget {
  const ListenableHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 自動でdispose
    final counter = useState(ValueNotifier<int>(0));

    // ✅ useListenable: 値の変更を監視してrebuild
    // （値自体は取得しない、変更があったことだけ検知）
    useListenable(counter.value);

    void increment() {
      counter.value.value++;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版 (useListenable)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('useListenableを使用:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            // ✅ ValueListenableBuilder不要
            Text(
              '${counter.value.value}',
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
