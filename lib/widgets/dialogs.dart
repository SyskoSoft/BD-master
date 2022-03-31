import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class DialogClickEvent{
  onButtonPressed(){}
}
class Dialogs {

  static Future<void> showAlertDialog(
      BuildContext context, String title, String errorMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.textFieldInputColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: AppColors.textFieldInputColor,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue',
                  style: TextStyle(
                    color: AppColors.upperTitleColor,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertDialogWithClick(
      BuildContext context, String title, String errorMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.textFieldInputColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: AppColors.textFieldInputColor,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue',
                  style: TextStyle(
                    color: AppColors.upperTitleColor,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {

              },
            ),
          ],
        );
      },
    );
  }
}
