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
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('animation')));
  }
}
