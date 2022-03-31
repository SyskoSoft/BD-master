import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class Variant3Button extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  const Variant3Button({
    Key? key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.greyButtonFillColor,
        side: const BorderSide(width: 1.0, color: AppColors.greyButtonFillColor),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Text(
          buttonText!,
          style: const TextStyle(
            color: AppColors.textFieldInputColor,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
