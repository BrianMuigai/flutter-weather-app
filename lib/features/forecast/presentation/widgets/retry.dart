import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  final String? message;
  final VoidCallback? onRefresh;
  const Retry({super.key, this.message, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message ?? '',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        IconButton(onPressed: onRefresh, icon: Icon(Icons.refresh))
      ],
    );
  }
}
