import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScrollHooks extends HookConsumerWidget {
  const ScrollHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final showBackToTop = useState(false);
    final topListItem = useState(0);

    useEffect(() {
      void onScroll() {
        if (scrollController.offset > 200 && !showBackToTop.value) {
          showBackToTop.value = true;
        } else if (scrollController.offset <= 200 && showBackToTop.value) {
          showBackToTop.value = false;
        }
      }

      scrollController.addListener(onScroll);

      return () {
        scrollController.removeListener(onScroll);
      };
    }, []);

    useEffect(() {
      void changeListItemColor() {
        final listTileHeight = 80;
        final offset = scrollController.offset;
        final itemNum = (offset / listTileHeight).round();
        topListItem.value = itemNum;
      }

      scrollController.addListener(changeListItemColor);

      return () => scrollController.removeListener(changeListItemColor);
    }, [scrollController]);

    void scrollToTop() {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('HookWidget版')),
      body: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 80,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        topListItem.value == index ? Colors.red : Colors.white,
                    child: Text('${index + 1}'),
                  ),
                  title: Text('アイテム ${index + 1}'),
                  subtitle: Text('これは${index + 1}番目のアイテムです'),
                ),
              );
            },
          ),
          // トップへ戻るボタン
          if (showBackToTop.value)
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                onPressed: scrollToTop,
                child: const Icon(Icons.arrow_upward),
              ),
            ),
        ],
      ),
    );
  }
}
