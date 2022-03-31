import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    Key? key,
    required this.textEditingController,
    required this.textFieldTitle,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String textFieldTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            textFieldTitle,
            style: const TextStyle(
              fontSize: 10.0,
              color: AppColors.textFieldTitleColor,
            ),
          ),
        ),
        TextField(
          controller: textEditingController,
          style: const TextStyle(fontSize: 16.0, color: AppColors.textFieldInputColor),
          cursorColor: AppColors.textFieldInputColor,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor),
            ),
          ),
        ),
      ],
    );
  }
}
