import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/user_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemorizedHooks extends HookConsumerWidget {
  const MemorizedHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(userListProvider);
    final searchText = useState('');

    final filteredUsers = useMemoized(() {
      debugPrint('Hooks: フィルタリング実行');
      if (searchText.value.isEmpty) return allUsers;

      return allUsers.where((user) {
        return user.name.contains(searchText.value) ||
            user.age.toString().contains(searchText.value);
      }).toList();
    }, [searchText.value]);

    return Scaffold(
      appBar: AppBar(title: Text('useMemorized: hooks')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '名前または年齢で検索',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchText.value = value; // ★ 値が変わるとuseMemoizedが再計算
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('年齢: ${user.age}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
