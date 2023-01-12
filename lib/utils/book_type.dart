// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BookType extends StatelessWidget {
  final String bookType;
  final bool isSelected;
  final VoidCallback onTap;
  BookType({
    required this.bookType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          bookType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.deepOrange : Colors.white,
          ),
        ),
      ),
    );
  }
}
