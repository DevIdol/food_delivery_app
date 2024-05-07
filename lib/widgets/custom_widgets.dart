import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/constants.dart';
import '../helpers/helpers.dart';

Widget headerTitle(
    {required BuildContext context, required String title, Color? color}) {
  return Text(title,
      style: textStyle(
          context: context,
          txtColor: color,
          fontSize: 0.08,
          fontWeight: FontWeight.w900));
}

TextStyle textStyle(
    {required BuildContext context,
    Color? txtColor = AppColor.darkColor,
    FontWeight? fontWeight = FontWeight.w600,
    double? fontSize = 0.035}) {
  return TextStyle(
    fontSize: displayWidth(context) * fontSize!,
    color: txtColor,
  );
}
