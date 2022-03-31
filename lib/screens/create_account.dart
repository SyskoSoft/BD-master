import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_truck_flutter_app/providers/web_service_manager.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';
import 'package:food_truck_flutter_app/utilities/utils.dart';
import 'package:food_truck_flutter_app/widgets/buttons/main_button.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/password_text_field.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/plain_text_field.dart';
import '../models/login_response.dart';
import '../widgets/NoGlow.dart';
import 'registration_pending.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final businessNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _createAccount(
      String email, String name, String businessName, String password) async {
   /* try {
      await WebServiceManager.createUser(email, name, businessName, password);
      passwordController.text = '';
      confirmPasswordController.text = '';

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegistrationPending()));
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
          exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(
          context, 'Failed to Create Account', errorMessage);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
          child: ScrollConfiguration(
            behavior: NoGlow(),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
                      child: SvgPicture.asset(
                        "assets/icons/arrow back.svg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.upperTitleColor,
                        ),
                      ),
                    )),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      'new account',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lowerTitleColor,
                      ),
                    ),
                  ),
                ),
                PlainTextField(
                    textFieldTitle: 'EMAIL ADDRESS',
                    textEditingController: emailController),
                const SizedBox(height: 10),
                PlainTextField(
                    textFieldTitle: 'FULL NAME',
                    textEditingController: nameController),
                const SizedBox(height: 10),
                PlainTextField(
                    textFieldTitle: 'BUSINESS NAME',
                    textEditingController: businessNameController),
                const SizedBox(height: 10),
                PasswordTextField(
                    textFieldTitle: 'PASSWORD',
                    textEditingController: passwordController),
                const SizedBox(height: 10),
                PasswordTextField(
                    textFieldTitle: 'CONFIRM PASSWORD',
                    textEditingController: confirmPasswordController),
                const SizedBox(height: 50),
                MainButton(
                  buttonText: 'CREATE NEW ACCOUNT',
                  onPressed: () {
                    if (Utils.verifyName(context, nameController.text) &&
                        Utils.verifyBusinessName(context, businessNameController.text) &&
                        Utils.verifyPasswords(context, passwordController.text,
                            confirmPasswordController.text)) {
                      _createAccount(emailController.text, nameController.text,
                          businessNameController.text, passwordController.text);
                    }
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
