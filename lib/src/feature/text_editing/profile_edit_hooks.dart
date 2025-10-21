import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileEditHooks extends HookConsumerWidget {
  const ProfileEditHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 自動でdisposeされる
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final bioController = useTextEditingController();

    void clear() {
      nameController.clear();
      emailController.clear();
      bioController.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: clear, child: const Text('クリア')),
            const SizedBox(height: 32),
            const Text(
              '入力内容:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // ✅ useValueListenableでシンプルに監視
            Text('名前: ${useValueListenable(nameController).text}'),
            Text('メール: ${useValueListenable(emailController).text}'),
            Text('自己紹介: ${useValueListenable(bioController).text}'),
          ],
        ),
      ),
    );
  }
}
