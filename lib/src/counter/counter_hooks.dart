import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterHooks extends HookWidget {
  const CounterHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0); // useStateで状態管理したい変数を定義

    useEffect(() {
      debugPrint('カウント：${counter.value}');
      return () {
        null;
      };
    }, [counter.value]);

    return Column(
      children: [
        Text('Hooks'),
        Text('${counter.value}'), // .valueの値が変化すると自動的に再描画してくれる
        ElevatedButton(
          onPressed: () {
            counter.value++; // 状態を更新する場合.valueを操作する
          },
          child: Icon(Icons.add_box_outlined),
        ),
      ],
    );
  }
}
