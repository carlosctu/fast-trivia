import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const EmptyStateWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/gif/search.gif",
              height: 64,
            ),
            const SizedBox(height: 16),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
              child: Column(
                children: [
                  Text(title),
                  const SizedBox(height: 2),
                  Text(subtitle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
