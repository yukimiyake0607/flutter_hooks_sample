import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/listenable/listenable_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/listenable/listenable_stateful.dart';
import 'package:flutter_hooks_sample/src/feature/listenable/value_listenable_hooks.dart';

class ListenableMenuButtons extends StatelessWidget {
  const ListenableMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useListenable/useValueListenable サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ListenableStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ListenableHooks()),
            );
          },
          child: const Text('useListenable版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ValueListenableHooks()),
            );
          },
          child: const Text('useValueListenable版'),
        ),
      ],
    );
  }
}
