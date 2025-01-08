import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final bool isExpanded;
  const FilterWidget({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: isExpanded ? 200.0 : 0.0, // Thay đổi chiều cao
      child: const Center(
        child: Text(
          "This is a content",
          style: TextStyle(fontSize: 16),
        ),

      )

    );
  }
}
