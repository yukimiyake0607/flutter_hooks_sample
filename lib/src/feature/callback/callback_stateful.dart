import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/callback/counter_button.dart';

class CallbackStateful extends StatefulWidget {
  const CallbackStateful({super.key});

  @override
  State<CallbackStateful> createState() => _CallbackStatefulState();
}

class _CallbackStatefulState extends State<CallbackStateful> {
  int _count = 0;
  int _otherValue = 0;

  @override
  Widget build(BuildContext context) {
    // ❌ buildが呼ばれるたびに新しい関数が作られる
    void increment() {
      setState(() {
        _count++;
      });
    }

    void changeOther() {
      setState(() {
        _otherValue++;
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget版')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カウント: $_count', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            Text('別の値: $_otherValue', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 32),
            // ❌ 「別の値を変更」を押しても、incrementが新しく作られるため
            // CounterButtonが再構築される（不要な再構築）
            CounterButton(onPressed: increment, label: 'カウント+1'),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: changeOther, child: const Text('別の値を変更')),
            const SizedBox(height: 24),
            const Text(
              '👆「別の値を変更」を押すと\nCounterButtonが再構築される',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
