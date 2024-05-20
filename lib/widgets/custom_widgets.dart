import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../utils/utils.dart';

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

Future<void> showAlertDialog(
    {required BuildContext context,
    String? title,
    String? content,
    String confirm = 'OK',
    required VoidCallback okFunc}) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(content!),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              okFunc();
              Navigator.of(context).pop();
            },
            child: Text(confirm,
                style: TextStyle(fontSize: displayWidth(context) * 0.044)),
          ),
        ],
      );
    },
  );
}

Future<void> showConfirmDialog(
    {required BuildContext context,
    required String title,
    String confirm = 'OK',
    String cancel = "CANCEL",
    required VoidCallback okFunc}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
              fontSize: displayWidth(context) * 0.042,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(cancel,
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.044,
                    color: AppColor.errorColor,
                    fontWeight: FontWeight.w400)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(confirm,
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.044,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              okFunc();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
