import 'package:flutter/material.dart';

class TabStateful extends StatefulWidget {
  const TabStateful({super.key});

  @override
  State<TabStateful> createState() => _TabStatefulState();
}

class _TabStatefulState extends State<TabStateful>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget版'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'ホーム'),
            Tab(icon: Icon(Icons.search), text: '検索'),
            Tab(icon: Icon(Icons.person), text: 'プロフィール'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
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
