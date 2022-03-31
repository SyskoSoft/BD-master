import 'package:flutter/material.dart';

import 'package:food_truck_flutter_app/models/login_response.dart';
import 'package:food_truck_flutter_app/models/user.dart';
import 'package:food_truck_flutter_app/providers/web_service_manager.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';
import 'package:food_truck_flutter_app/screens/forget_password_screen.dart';
import 'package:food_truck_flutter_app/screens/home_screen.dart';
import 'package:food_truck_flutter_app/screens/select_business.dart';
import 'package:food_truck_flutter_app/widgets/buttons/main_button.dart';
import 'package:food_truck_flutter_app/widgets/buttons/variant_2_button.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/password_text_field.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/plain_text_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'create_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      LoginResponse loginResponse =
      await WebServiceManager.loginUser(email, password);

      if(loginResponse.code == "200"){
        User currentUser = User.currentUser;
        currentUser.code = loginResponse.code;
        currentUser.title = loginResponse.title;
        currentUser.message = loginResponse.message;
        // currentUser.token = loginResponse.token;

        passwordController.text = '';

        // String message = currentUser.message ?? "";
        // Dialogs.showAlertDialog(context, 'Success', message);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }else{
        await Dialogs.showAlertDialog(context, 'Error', loginResponse.message);
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
      exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(context, 'Sign In Failed', errorMessage);
    }
  }
  int _bottomNavIndex=0;
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
                  ToggleSwitch(
                    minWidth: 120.0,
                    cornerRadius: 100.0,
                    activeBgColors: [[Color(0xffE30000)], [Color(0xffE30000)]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.black,
                    initialLabelIndex: _bottomNavIndex,
                    totalSwitches: 2,
                    labels: ['LOGIN', 'SIGN UP'],
                    radiusStyle: true,
                    borderColor: [
                      Colors.red,
                    ],
                    borderWidth: 1,
                    onToggle: (index){
                      setState(() {
                        print(_bottomNavIndex = index!);
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _bottomNavIndex ==0?
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
                                    fillColor: MaterialStateProperty.resolveWith(getColor),
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
                                          builder: (context) => ForgetPassword( email: emailController.text,)));
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
                              child: Text('Login',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Montserrat",
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));

                            },
                          )

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
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
                              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
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
                  ):_bottomNavIndex ==1?
                  Column(
                    children: [
                      PlainTextField(
                          textEditingController: usernameController1,
                          textFieldTitle: 'User Name'),
                      const SizedBox(height: 10),
                      PlainTextField(
                          textEditingController: signuppasswedController1,
                          textFieldTitle: 'EMAIL ADDRESS'),
                      const SizedBox(height: 10),
                      PasswordTextField(
                          textEditingController: siginupemailController1,
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
                                    fillColor: MaterialStateProperty.resolveWith(getColor),
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
                                          builder: (context) => ForgetPassword( email: emailController.text,)));
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
                      Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100
                              ),
                              color: Colors.white,
                          ),
                          child: TextButton(

                            child: Center(
                              child: Text('SIGNUP',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Montserrat",
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){

                            },
                          )

                      ),
                    ],
                  ):Container(),
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
