import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/animation/animation_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/animation/animation_stateful.dart';

class AnimationControllerMenuButtons extends StatelessWidget {
  const AnimationControllerMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useAnimationController サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnimationStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnimationHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
