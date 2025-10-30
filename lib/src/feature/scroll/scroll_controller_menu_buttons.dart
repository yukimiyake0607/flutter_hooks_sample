import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/scroll/scroll_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/scroll/scroll_stateful.dart';

class ScrollControllerMenuButtons extends StatelessWidget {
  const ScrollControllerMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useScrollController サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScrollStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScrollHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
