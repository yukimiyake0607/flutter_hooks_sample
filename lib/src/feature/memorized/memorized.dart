import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/memorized_user.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/user_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// useMemorized（StatefulWidget版）
class Memorized extends StatefulWidget {
  const Memorized({super.key});

  @override
  State<Memorized> createState() => _MemorizedState();
}

class _MemorizedState extends State<Memorized> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';
  List<MemorizedUser>? _cachedFilteredUsers; // キャッシュ用の状態
  String? _cachedSearchText; // 前回の検索テキスト

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // フィルタリング処理（重い処理と仮定）
  List<MemorizedUser> _filterUsers(
    List<MemorizedUser> allUsers,
    String searchText,
  ) {
    debugPrint('🔴 StatefulWidget: フィルタリング実行');
    if (searchText.isEmpty) return allUsers;

    return allUsers.where((user) {
      return user.name.contains(searchText) ||
          user.age.toString().contains(searchText);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final allUsers = ref.watch(userListProvider);

        // キャッシュチェック：検索テキストが変わったときだけ再計算
        if (_cachedSearchText != _searchText) {
          _cachedFilteredUsers = _filterUsers(allUsers, _searchText);
          _cachedSearchText = _searchText;
        }

        final filteredUsers = _cachedFilteredUsers!;

        return Scaffold(
          appBar: AppBar(title: Text('useMemorized: stfl')),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: '名前または年齢で検索',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
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
          ),
        );
      },
    );
  }
}

class MemorizedMenuButtons extends StatelessWidget {
  const MemorizedMenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'useMemoized サンプル',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Memorized()),
            );
          },
          child: const Text('StatefulWidget版'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(builder: (_) => const UserSearchHooks()),
            // );
          },
          child: const Text('HookWidget版'),
        ),
      ],
    );
  }
}
