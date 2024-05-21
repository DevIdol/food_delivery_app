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

void showSnackBar(BuildContext context, String msg) {
  final Widget toastWithButton = Container(
    padding: const EdgeInsets.only(left: 19),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColor.darkColor,
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            msg,
            softWrap: true,
            style: commonStyle(
              context: context,
              size: 0.03,
              fontWeight: FontWeight.w500,
              color: AppColor.lightColor,
            ),
          ),
        ),
        const ColoredBox(
          color: AppColor.darkColor,
          child: SizedBox(
            width: 1,
            height: 23,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 20,
          ),
          color: AppColor.errorColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    ),
  );
  final snackBar = SnackBar(
    content: toastWithButton,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.zero,
    elevation: 0,
    duration: const Duration(milliseconds: 5000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

TextStyle commonStyle(
    {required BuildContext context,
    double size = 0.035,
    FontWeight fontWeight = FontWeight.w400,
    Color? color}) {
  return TextStyle(
    fontSize: displayWidth(context) * size,
    fontWeight: fontWeight,
    color: color,
  );
}
