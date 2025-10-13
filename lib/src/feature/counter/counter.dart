import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  void addCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Stateful Widget'),
        Text('$count'),
        ElevatedButton(
          onPressed: () {
            addCount();
          },
          child: Icon(Icons.add_box_rounded, size: 20),
        ),
      ],
    );
  }
}
