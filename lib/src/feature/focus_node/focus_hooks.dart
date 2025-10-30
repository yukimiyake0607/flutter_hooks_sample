import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusHooks extends HookConsumerWidget {
  const FocusHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 自動でdispose
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    void moveToPassword() {
      passwordFocusNode.requestFocus();
    }

    void moveToEmail() {
      emailFocusNode.requestFocus();
    }

    return Scaffold(
      appBar: AppBar(title: Text('HookWidget版')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              focusNode: passwordFocusNode,
              decoration: const InputDecoration(
                labelText: 'パスワード',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => moveToPassword(),
              child: Text('パスワード欄へ移動'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => moveToEmail(),
              child: Text('メールアドレス欄へ移動'),
            ),
          ],
        ),
      ),
    );
  }
}
