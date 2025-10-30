import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/page/page_content.dart';

class PageStateful extends StatefulWidget {
  const PageStateful({super.key});

  @override
  State<PageStateful> createState() => _PageStatefulState();
}

class _PageStatefulState extends State<PageStateful> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // ❌ リスナーを手動で登録
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // ❌ リスナーを手動で削除
    _pageController.removeListener(_onPageChanged);
    // ❌ コントローラーを手動でdispose
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _nextPage() {
    _pageController.animateToPage(
      _currentPage + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.animateToPage(
      _currentPage - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget版')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                PageContent(
                  color: Colors.blue,
                  icon: Icons.home,
                  title: 'ページ 1',
                ),
                PageContent(
                  color: Colors.green,
                  icon: Icons.star,
                  title: 'ページ 2',
                ),
                PageContent(
                  color: Colors.orange,
                  icon: Icons.favorite,
                  title: 'ページ 3',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // ページインジケーター
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _currentPage > 0 ? _previousPage : null,
                      child: const Text('前へ'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _currentPage < 2 ? _nextPage : null,
                      child: const Text('次へ'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
