import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/feature/counter/counter.dart';
import 'package:flutter_hooks_sample/src/feature/counter/counter_hooks.dart';
import 'package:flutter_hooks_sample/src/feature/memorized/memorized.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Counter()),
                    Expanded(child: CounterHooks()),
                  ],
                ),
                const SizedBox(height: 20),
                const MemorizedMenuButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
