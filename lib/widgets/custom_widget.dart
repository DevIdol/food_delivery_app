import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget positionImage({
  double? top,
  double? bottom,
  double? left,
  double? right,
  required String img,
  required double width,
  required double height,
}) {
  return Positioned(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: SvgPicture.asset(
      img,
      width: width,
      height: height,
    ),
  );
}
