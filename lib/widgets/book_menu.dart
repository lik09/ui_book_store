import 'package:flutter/material.dart';

class BookMenu extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  const BookMenu({super.key ,
  required this.title , 
  this.isSelected = false , 
  this.onTap});

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.blue.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.blueAccent.withOpacity(0.6), blurRadius: 8)]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

