import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  const FormWidget({
    super.key,
    required this.formKey,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
