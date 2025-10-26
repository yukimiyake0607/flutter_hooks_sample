import 'package:flutter/material.dart';

class AnimationStateful extends StatefulWidget {
  const AnimationStateful({super.key});

  @override
  State<AnimationStateful> createState() => _AnimationStatefulState();
}

class _AnimationStatefulState extends State<AnimationStateful>
    with SingleTickerProviderStateMixin {
  // 手動でAnimationController作成
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // initStateで初期化
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    // 手動でdispose
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    _controller.forward(from: 0.0);
  }

  void _reverseAnimation() {
    _controller.reverse(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget版')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('👋', style: TextStyle(fontSize: 80)),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _playAnimation,
                  child: const Text('表示'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _reverseAnimation,
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
