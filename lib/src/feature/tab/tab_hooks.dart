import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabHooks extends HookConsumerWidget {
  const TabHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HookWidget版'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'ホーム'),
            Tab(icon: Icon(Icons.search), text: '検索'),
            Tab(icon: Icon(Icons.person), text: 'プロフィール'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 100, color: Colors.blue),
                SizedBox(height: 16),
                Text('ホーム画面', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 100, color: Colors.green),
                SizedBox(height: 16),
                Text('検索画面', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 100, color: Colors.orange),
                SizedBox(height: 16),
                Text('プロフィール画面', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
