import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final Color? color;
  final Widget child;
  final double  radius;
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    super.key,
    this.width,
    this.color,
    this.padding,
    this.radius = 15,
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
        padding: padding,
        child: child,
      ),
    );
  }
}
