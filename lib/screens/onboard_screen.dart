import 'package:flutter/material.dart';

import 'package:food_truck_flutter_app/models/login_response.dart';
import 'package:food_truck_flutter_app/models/user.dart';
import 'package:food_truck_flutter_app/providers/web_service_manager.dart';
import 'package:food_truck_flutter_app/resources/app_colors.dart';
import 'package:food_truck_flutter_app/screens/Vendor_Modules/VendorLogin.dart';
import 'package:food_truck_flutter_app/screens/forget_password_screen.dart';
import 'package:food_truck_flutter_app/screens/home_screen.dart';
import 'package:food_truck_flutter_app/screens/login_screen.dart';
import 'package:food_truck_flutter_app/screens/select_business.dart';
import 'package:food_truck_flutter_app/widgets/buttons/main_button.dart';
import 'package:food_truck_flutter_app/widgets/buttons/variant_2_button.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/password_text_field.dart';
import 'package:food_truck_flutter_app/widgets/text%20fields/plain_text_field.dart';

import 'create_account.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

      User currentUser = User.currentUser;
      // currentUser.token = loginResponse.token;

      passwordController.text = '';

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SelectBusiness()));
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
      exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(context, 'Sign In Failed', errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/onboard_background.jpg'),
            fit: BoxFit.cover,
          )),
          padding: const EdgeInsets.only(left: 30, right: 30,
              top: 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(child: Image.asset('assets/images/FoodWelcome.png',
              ),),
              Container(
                child: Image.asset('assets/images/GGGG.png',
                  width: 180,
                  height: 145,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0xffe30000),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],),
                  child: Center(
                    child:InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage('assets/images/young_women.png')
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              "I'm a Food Truck\nCustomer",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                letterSpacing: 0.5,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                    ),
                  )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child:
                  InkWell(
                    child: Container(
                        height: 155,
                        decoration: BoxDecoration(color: Color(0xfff54b00),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/food_trucker.png')
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                  "I'm a Food\nTrucker",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.5,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center
                              ),
                            ],
                          ),
                        )
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VendorLogin()));
                    },
                  ),),

                  const SizedBox(width: 16),
                  Expanded(child: Container(
                      height: 155,
                      decoration: BoxDecoration(color: Color(0xfff2b913),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],), child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/event_organizer.png')
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            "I'm an Event\nOrganizer",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.5,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  )
                  ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
