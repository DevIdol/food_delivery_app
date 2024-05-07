import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final double height;
  final Color btnColor;
  final FontWeight fontWeight;
  final Color txtColor;

  const ButtonWidget({
    super.key,
    this.btnColor = AppColor.primaryColor,
    this.fontWeight = FontWeight.bold,
    this.txtColor = AppColor.lightColor,
    required this.onPressed,
    required this.btnText,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: displayWidth(context) * 0.035,
          fontWeight: FontWeight.bold,
          color: txtColor,
        ),
      ),
    );
  }
}
