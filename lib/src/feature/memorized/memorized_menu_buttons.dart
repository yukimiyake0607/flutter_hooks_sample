import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/memorized.dart';

class MemorizedMenuButtons extends StatelessWidget {
  const MemorizedMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useMemoized サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Memorized()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(builder: (_) => const UserSearchHooks()),
            // );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
