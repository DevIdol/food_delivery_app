import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../utils/utils.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color txtColor;
  final IconData prefixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final TextInputType txtInputType;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.obscureText,
    this.txtInputType = TextInputType.text,
    this.txtColor = AppColor.darkColor,
    this.focusNode,
    this.onEditingComplete,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: displayWidth(context) * 0.035,
      color: txtColor,
    );

    return TextFormField(
      controller: controller,
      keyboardType: txtInputType,
      obscureText: obscureText,
      focusNode: focusNode,
      style: textStyle,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: textStyle,
        errorStyle: textStyle.copyWith(
          fontSize: displayWidth(context) * 0.025,
          color: AppColor.errorColor,
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onEditingComplete: onEditingComplete,
      validator: validator,
    );
  }
}
