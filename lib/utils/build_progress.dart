import 'package:flutter/material.dart';

class BuildProgress extends StatelessWidget {
  const BuildProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.done_outline_rounded,
      color: Colors.green,
      size: 56,
    );
  }
}
