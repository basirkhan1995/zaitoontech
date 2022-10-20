import 'package:flutter/material.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel",
        required VoidCallback? okBtnFunction}) {
        showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Column(

            ),
            actions: <Widget>[
              TextButton(
                onPressed: okBtnFunction,
                child: Text(okBtnText),
              ),
              TextButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }

}