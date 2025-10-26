import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimationHooks extends HookConsumerWidget {
  const AnimationHooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 自動でdispose, vsync
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    final fadeAnimation = useAnimation(
      Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn)),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(
        begin: 0.5,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack)),
    );

    void playAnimation() {
      controller.forward(from: 0.0);
    }

    void reverseAnimation() {
      controller.reverse(from: 1.0);
    }

    return Scaffold(
      appBar: AppBar(title: Text('HookWidget版')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: fadeAnimation,
              child: Transform.scale(
                scale: scaleAnimation,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('🎉', style: TextStyle(fontSize: 80)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: playAnimation,
                  child: const Text('表示'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: reverseAnimation,
                  child: const Text('非表示'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
