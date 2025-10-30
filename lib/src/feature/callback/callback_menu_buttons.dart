import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/callback/callback_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/callback/callback_stateful.dart';

class CallbackMenuButtons extends StatelessWidget {
  const CallbackMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useCallback サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CallbackStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CallbackHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
