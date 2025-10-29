import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/animation/animation_controller_menu_buttons.dart';
import 'package:flutter_hooks_sample/src/feature/counter/counter.dart';
import 'package:flutter_hooks_sample/src/feature/counter/counter_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/memorized_menu_buttons.dart';
import 'package:flutter_hooks_sample/src/feature/text_editing/text_editing_controller_menu_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'useState サンプル',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(child: Counter()),
                    Expanded(child: CounterHooks()),
                  ],
                ),
                const SizedBox(height: 20),
                const MemorizedMenuButtons(),
                const Text(
                  'buildメソッドは何度も実行されるもの。キーボード表示、スクロール、setStateなど。buildメソッド内のフィルタリング計算はとても重くbuildメソッドごとに実行するとパフォーマンスが悪くなる。そこで前回テキストと比較してテキストが変更した時のみ計算をすればパフォーマンスが良くなる。しかし手動で実装するのは賢くない。useMemorizedを使用すれば変数を自分で管理する必要ない、比較ロジックも必要ないなどメリットがある。',
                ),
                const SizedBox(height: 20),
                const TextEditingControllerMenuButtons(),
                const Text('disposeを書く必要がない、コントローラを増やしても安全、コードがシンプル'),
                const SizedBox(height: 20),
                const AnimationControllerMenuButtons(),
                const Text('Mixin不要、initState不要、dispose不要、AnimateBuilder不要'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
