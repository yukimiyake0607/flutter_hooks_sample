import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CounterButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // このログで再構築を確認
    debugPrint('🔄 CounterButton ($label) が再構築されました');

    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
