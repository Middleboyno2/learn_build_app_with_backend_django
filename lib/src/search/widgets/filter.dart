import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final bool isExpanded;
  const FilterWidget({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      alignment: Alignment.topCenter,
      height: isExpanded ? 200.0 : 0.0, // Thay đổi chiều cao
      color: Colors.grey.shade200,
      child: Center(
        child: Text(
          "This is expandable content",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
