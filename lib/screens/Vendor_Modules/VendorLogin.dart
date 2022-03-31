import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/screens/Vendor_Modules/VendorHomeScreen.dart';

import '../../models/login_response.dart';
import '../../models/user.dart';
import '../../providers/web_service_manager.dart';
import '../../resources/app_colors.dart';
import '../../widgets/dialogs.dart';
import '../../widgets/text fields/password_text_field.dart';
import '../../widgets/text fields/plain_text_field.dart';
import '../forget_password_screen.dart';
import 'VendorSignUp.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class VendorLogin extends StatefulWidget {
  const VendorLogin({Key? key}) : super(key: key);

  @override
  _VendorLoginState createState() => _VendorLoginState();
}

class _VendorLoginState extends State<VendorLogin> {

  final emailController = TextEditingController();
  final siginupemailController = TextEditingController();
  final siginupemailController1 = TextEditingController();
  final usernameController = TextEditingController();
  final usernameController1 = TextEditingController();
  final signuppasswedController = TextEditingController();
  final signuppasswedController1 = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController1 = TextEditingController();

  bool isChecked = false;

  var dialog;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> _validateInput(String email, String password) async {
    if (email.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Sign In Failed', 'Email field is blank.');
      return;
    }

    if (password.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Sign In Failed', 'Password field is blank.');
      return;
    }


    try {
      EasyLoading.show(status: 'loading...');
      LoginResponse loginResponse =
      await WebServiceManager.loginUser(email, password);
      EasyLoading.dismiss();
      if (loginResponse.code == "200") {
        User currentUser = User.currentUser;
        currentUser.code = loginResponse.code;
        currentUser.title = loginResponse.title;
        currentUser.message = loginResponse.message;
        currentUser.token = loginResponse.token;

        passwordController.text = '';

        // String message = currentUser.message ?? "";
        // Dialogs.showAlertDialog(context, 'Success', message);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VendorHomeScreen()));
      } else {
        await Dialogs.showAlertDialog(context, 'Error', loginResponse.message);
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
      exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(context, 'Sign In Failed', errorMessage);
    }
  }

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(

                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp,
                        size: 16,
                        color: Colors.white,)),
                ),
              ),
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
                    height: 20,
                  ),
                  Column(
                    children: [
                      PlainTextField(
                          textEditingController: emailController,
                          textFieldTitle: 'EMAIL ADDRESS'),
                      const SizedBox(height: 10),
                      PasswordTextField(
                          textEditingController: passwordController,
                          textFieldTitle: 'PASSWORD'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,
                        children: <Widget>[
                          Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty
                                        .resolveWith(getColor),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  )),
                              Text('Remember Me'),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPassword(
                                                email: emailController.text,)));
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: AppColors
                                        .blueButtonColor, // this is for your text colour
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 43,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100
                                  ),
                                  color: Color(0xffE30000)
                              ),
                              child: TextButton(

                                child: Center(
                                  child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: "Montserrat",
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _validateInput(emailController.text,
                                      passwordController.text);
                                },
                              )

                          ),
                          Container(
                              height: 43,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE30000)),
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xffffff)
                              ),
                              child: TextButton(

                                  child: Center(
                                    child: Text('Sign Up',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Montserrat",
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VendorSignUp()));
                                  }
                              )

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Divider(
                                color: Colors.red,
                                thickness: 1,
                                height: 50,
                              )),
                        ),

                        Text("OR Login With",
                          style: TextStyle(
                            color: Color(0xffF2B913),
                          ),
                        ),

                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 10.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.red,
                                height: 50,

                              )),
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Image.asset('assets/facebook.png')),
                          SizedBox(width: 20,),
                          Container(child: Image.asset('assets/google.png')),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}