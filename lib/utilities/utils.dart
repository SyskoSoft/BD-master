import 'package:flutter/cupertino.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';

class Utils {
  static bool verifyPasswords(
      BuildContext context, String password, String confirmPassword) {
    // Check if confirmPassword matches password
    if (confirmPassword != password) {
      String errorMessage = 'Passwords do not match!';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    }

    // Check if password is between 8-12 characters
    if (password.length < 8 || password.length > 12) {
      String errorMessage = 'Password must be 8-12 characters long.';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    }

    // Check if password contains one uppercase letter, one lowercase letter, and one number
    bool containsNumber = password.contains(RegExp(r'[0-9]'));
    bool containsUppercase = password.contains(RegExp(r'[A-Z]'));
    bool containsLowercase = password.contains(RegExp(r'[a-z]'));

    if (!containsNumber || !containsUppercase || !containsLowercase) {
      String errorMessage =
          'Password must contain an uppercase letter, a lowercase letter, and a number.';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    }

    return true;
  }

  static bool verifyBusinessName(BuildContext context, String businessName) {
    if (businessName.length > 75) {
      String errorMessage = 'Business name cannot be more than 75 characters.';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    }

    return true;
  }

  static bool verifyName(BuildContext context, String name) {
    if (name.isEmpty) {
      String errorMessage = 'Name is a required field.';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    } else if (name.length > 60) {
      String errorMessage = 'Name cannot be more than 60 characters.';
      Dialogs.showAlertDialog(context, 'Invalid Input', errorMessage);
      return false;
    }

    return true;
  }
}
