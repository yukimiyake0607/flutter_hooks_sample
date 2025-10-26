import 'package:flutter/material.dart';

class AnimationStateful extends StatefulWidget {
  const AnimationStateful({super.key});

  @override
  State<AnimationStateful> createState() => _AnimationStatefulState();
}

class _AnimationStatefulState extends State<AnimationStateful> with SingleTickerProviderStateMixin {
  
  // 手動でAnimationController作成
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}