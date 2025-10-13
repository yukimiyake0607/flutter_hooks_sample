import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/counter.dart';
import 'package:flutter_hooks_sample/src/counter_hooks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(children: [Counter(), CounterHooks()]),
        ),
      ),
    );
  }
}
