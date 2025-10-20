import 'package:flutter/material.dart';

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
      ],
    );
  }
}
