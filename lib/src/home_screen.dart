import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [Counter()])));
  }
}
