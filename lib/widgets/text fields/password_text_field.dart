import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.textEditingController,
    required this.textFieldTitle,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String textFieldTitle;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _passwordVisible;
  late String textFieldTitle;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    textFieldTitle = widget.textFieldTitle;
    textEditingController = widget.textEditingController;
  }

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
          obscureText: !_passwordVisible,
          style: const TextStyle(color: AppColors.textFieldInputColor),
          cursorColor: AppColors.textFieldInputColor,
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorderColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorderColor),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 2,
                minHeight: 2,
              ),
              suffixIcon: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 20,
                      child: SvgPicture.asset(_passwordVisible
                          ? 'assets/icons/hide password.svg'
                          : 'assets/icons/show password.svg'),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  })),
        ),
      ],
    );
  }
}
