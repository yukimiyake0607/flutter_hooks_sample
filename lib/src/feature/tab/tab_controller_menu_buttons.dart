import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/tab/tab_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/tab/tab_stateful.dart';

class TabControllerMenuButtons extends StatelessWidget {
  const TabControllerMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useTabController サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TabStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TabHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
