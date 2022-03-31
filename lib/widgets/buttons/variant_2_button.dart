import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class Variant2Button extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  const Variant2Button({
    Key? key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
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
            color: AppColors.textFieldTitleColor,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
