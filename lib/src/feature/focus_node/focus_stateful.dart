import 'package:flutter/material.dart';

class FocusStateful extends StatefulWidget {
  const FocusStateful({super.key});

  @override
  State<FocusStateful> createState() => _FocusStatefulState();
}

class _FocusStatefulState extends State<FocusStateful> {
  // 手動でFocusNodeを作成
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _moveToPassword() {
    _passwordFocusNode.requestFocus();
  }

  void _moveToEmail() {
    _emailFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StatefulWidget版')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              focusNode: _emailFocusNode,
              decoration: const InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              focusNode: _passwordFocusNode,
              decoration: const InputDecoration(
                labelText: 'パスワード',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _moveToPassword(),
              child: Text('パスワード欄へ移動'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _moveToEmail(),
              child: Text('メールアドレス欄へ移動'),
            ),
          ],
        ),
      ),
    );
  }
}
