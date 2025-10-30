import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/page/page_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/page/page_stateful.dart';

class PageControllerMenuButtons extends StatelessWidget {
  const PageControllerMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'usePageController サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageStateful()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageHooks()),
            );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
