import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/focus_node/focus_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/focus_node/focus_stateful.dart';

class FocusNodeMenuButtons extends StatelessWidget {
  const FocusNodeMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useFocusNode サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FocusStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FocusHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
