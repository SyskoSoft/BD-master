import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color btnColor;
  final Color textColor;

  const AppButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.btnColor = Colors.black54,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return MaterialButton(
        onPressed: () => onTap(),
        color: btnColor,
        elevation: 6.0,
        minWidth: size.width,
        splashColor: Colors.white.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.01),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            // vertical: size.height * 0.0185,
            vertical: size.height * 0.02,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ));

  }
}

