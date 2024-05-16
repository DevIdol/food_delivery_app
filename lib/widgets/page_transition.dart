import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTransition extends CustomTransition {
  final Alignment? alignment;
  final Axis? axis;

  PageTransition({
    this.alignment = Alignment.topRight,
    this.axis = Axis.horizontal,
  });

  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      alignment: this.alignment ?? alignment ?? Alignment.center,
      child: SizeTransition(
        sizeFactor: animation,
        axis: axis ?? Axis.horizontal,
        axisAlignment: 0,
        child: child,
      ),
    );
  }
}