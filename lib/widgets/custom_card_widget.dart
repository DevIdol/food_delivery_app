import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final Color? color;
  final Widget child;

  const CustomCard({
    super.key,
    this.width,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
