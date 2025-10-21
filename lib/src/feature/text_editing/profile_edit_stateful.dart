import 'package:flutter/material.dart';

class ProfileEditStateful extends StatefulWidget {
  const ProfileEditStateful({super.key});

  @override
  State<ProfileEditStateful> createState() => _ProfileEditStatefulState();
}

class _ProfileEditStatefulState extends State<ProfileEditStateful> {
  // 手動でコントローラ作成
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _clear() {
    _nameController.clear();
    _emailController.clear();
    _bioController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget版')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bioController,
              decoration: const InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _clear, child: const Text('クリア')),
            const SizedBox(height: 32),
            const Text(
              '入力内容:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // ❌ リアルタイム更新のためにsetStateが必要
            ValueListenableBuilder(
              valueListenable: _nameController,
              builder: (context, value, child) {
                return Text('名前: ${_nameController.text}');
              },
            ),
            ValueListenableBuilder(
              valueListenable: _emailController,
              builder: (context, value, child) {
                return Text('メール: ${_emailController.text}');
              },
            ),
            ValueListenableBuilder(
              valueListenable: _bioController,
              builder: (context, value, child) {
                return Text('自己紹介: ${_bioController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
