import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class MainButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  const MainButton({
    Key? key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.upperTitleColor,
        side: const BorderSide(width: 1.0, color: AppColors.upperTitleColor),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Text(
          buttonText!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
