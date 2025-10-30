import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/page/page_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageHooks extends HookConsumerWidget {
  const PageHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 1行で作成、自動でdispose
    final pageController = usePageController();
    final currentPage = useState(0);

    // ✅ useEffectでリスナー登録、自動でクリーンアップ
    useEffect(() {
      void onPageChanged() {
        final page = pageController.page?.round() ?? 0;
        if (page != currentPage.value) {
          currentPage.value = page;
        }
      }

      pageController.addListener(onPageChanged);

      return () {
        pageController.removeListener(onPageChanged);
      };
    }, []);

    void nextPage() {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    void previousPage() {
      pageController.animateToPage(
        currentPage.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
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
                            currentPage.value == index
                                ? Colors.blue
                                : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentPage.value > 0 ? previousPage : null,
                      child: const Text('前へ'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: currentPage.value < 2 ? nextPage : null,
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
