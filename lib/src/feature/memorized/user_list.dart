import 'package:flutter_hooks_sample/src/feature/memorized/memorized_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userListProvider = Provider<List<MemorizedUser>>((ref) {
  return List.generate(1000, (int index) {
    return MemorizedUser(id: index, name: 'ユーザー$index', age: 20 + (index % 50));
  });
});
