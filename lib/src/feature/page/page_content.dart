import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const PageContent({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      color: color.withOpacity(0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: color),
            const SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 32, color: color)),
          ],
        ),
      ),
    );
  }
}
