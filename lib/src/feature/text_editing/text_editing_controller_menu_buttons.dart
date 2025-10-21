import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/text_editing/profile_edit_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/text_editing/profile_edit_stateful.dart';

class TextEditingControllerMenuButtons extends StatelessWidget {
  const TextEditingControllerMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useTextEditingController サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileEditStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileEditHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
