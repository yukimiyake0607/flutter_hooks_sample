import 'package:flutter/material.dart';

class ListenableStateful extends StatefulWidget {
  const ListenableStateful({super.key});

  @override
  State<ListenableStateful> createState() => _ListenableStatefulState();
}

class _ListenableStatefulState extends State<ListenableStateful> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    // ❌ 手動でdisposeが必要
    _counter.dispose();
    super.dispose();
  }

  void _increment() {
    _counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget版')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ValueListenableBuilderを使用:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // ❌ ValueListenableBuilderでラップが必要
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _increment, child: const Text('カウント+1')),
          ],
        ),
      ),
    );
  }
}
