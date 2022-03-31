import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_truck_flutter_app/components/loading_prograss_dialog.dart';
import 'package:food_truck_flutter_app/models/forgot_password_response.dart';
import 'package:food_truck_flutter_app/providers/web_service_manager.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';
import 'package:food_truck_flutter_app/utilities/utils.dart';
import 'package:food_truck_flutter_app/utils/extensions_function.dart';
import 'package:food_truck_flutter_app/widgets/buttons/main_button.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/password_text_field.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/plain_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';

class ForgetPassword extends StatefulWidget{
  String email;

  ForgetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>  implements DialogClickEvent {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  bool isEmailSubmitted = true;
  bool isCodeSubmitted = false;
  bool isPasswordSubmitted = false;
  int viewVisibility = 0;
  String textDetails =
      "Enter the email address associated with your account. We'll send you a pin code to reset your password.";

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    errorController.close();
  }

  Future<void> _validateInput(String email) async {
    if (email.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Error', 'Email field is blank.');
      return;
    }

    try {
      ForgotPasswordResponse forgotPasswordResponse =
      await WebServiceManager.forgotPassword(email);

      if(forgotPasswordResponse.code == "200"){
        await Dialogs.showAlertDialogWithClick(context, forgotPasswordResponse.title, forgotPasswordResponse.message);
      }else{
        await Dialogs.showAlertDialog(context, forgotPasswordResponse.title, forgotPasswordResponse.message);
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
      exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(context, 'Error', errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    var currentText = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/onboard_background.jpg'),
            fit: BoxFit.cover,
          )),
          padding: const EdgeInsets.fromLTRB(30, 71, 30, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/logo/signup_signin.png'),
                  width: 162,
                ),
              ),
              const SizedBox(height: 43),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:
                  Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(29), child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      PlainTextField(
                          textEditingController: emailController,
                          textFieldTitle: 'EMAIL ADDRESS'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100
                              ),
                              color: Color(0xffE30000)
                          ),
                          child: TextButton(

                            child: Center(
                              child: Text('Send Email',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Montserrat",
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){
                            _validateInput(emailController.text);
                            },
                          ),
                      ),
                    ],
                  ),
                ],
              ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  @override
  onButtonPressed() {
    Navigator.pop(context);
  }
}
