import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/models/sign_up_request.dart';
import 'package:food_truck_flutter_app/models/sign_up_response.dart';
import 'package:food_truck_flutter_app/models/vendor/sign_up_vendor_request.dart';
import 'package:food_truck_flutter_app/screens/Vendor_Modules/VendorHomeScreen.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/login_response.dart';
import '../../models/user.dart';
import '../../providers/web_service_manager.dart';
import '../../resources/app_colors.dart';
import '../../widgets/dialogs.dart';
import '../../widgets/text fields/password_text_field.dart';
import '../../widgets/text fields/plain_text_field.dart';
import '../forget_password_screen.dart';
import 'VendorLogin.dart';
import 'VendorSignUp.dart';
class VendorSignUp extends StatefulWidget {
  const VendorSignUp({Key? key}) : super(key: key);

  @override
  _VendorSignUpState createState() => _VendorSignUpState();
}

class _VendorSignUpState extends State<VendorSignUp> {

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final emailController11 = TextEditingController();
  final enterphoneno = TextEditingController();
  final uploaddocs = TextEditingController();
  final passwordController11 = TextEditingController();
  final confirmpassword = TextEditingController();
  FilePickerResult? filePickerResult = null;

  bool isChecked = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController11.dispose();
    passwordController11.dispose();
  }

  Future<void> _validateInput(SignUpVendorRequest signUpRequest) async {
    if (signUpRequest.email.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Error', 'Email field is blank.');
      return;
    }

    if (signUpRequest.password.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Error', 'Password field is blank.');
      return;
    }

    if (signUpRequest.first_name.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Error', 'First Name field is blank.');
      return;
    }

    if (signUpRequest.last_name.isEmpty) {
      Dialogs.showAlertDialog(
          context, 'Error', 'Last Name field is blank.');
      return;
    }

    try {
      SignUpResponse signUpResponse =
      await WebServiceManager.signUpVendor(signUpRequest);

      if(signUpResponse.code == "200"){
        User currentUser = User.currentUser;
        currentUser.code = signUpResponse.code;
        currentUser.title = signUpResponse.title;
        currentUser.message = signUpResponse.message;
        currentUser.token = signUpResponse.token;
        currentUser.first_name = signUpRequest.first_name;
        currentUser.last_name = signUpRequest.last_name;
        currentUser.phone_number = signUpRequest.phone_number;
        // var image = signUpRequest.first_name;
        currentUser.email = signUpRequest.email;
        currentUser.password = signUpRequest.password;
        currentUser.device_token = signUpRequest.device_token;
        currentUser.device_name = signUpRequest.device_name;
        currentUser.role = signUpRequest.role;
        currentUser.latitude = signUpRequest.latitude;
        currentUser.longitude = signUpRequest.longitude;

        passwordController11.text = '';

        Dialogs.showAlertDialog(
            context, 'Token',  currentUser.token.toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => const VendorHomeScreen()));
      }else{
        await Dialogs.showAlertDialog(context, signUpResponse.title, signUpResponse.message);
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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

                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp,
                        size: 16,
                        color: Colors.white,)),
                ),
              ),
              const SizedBox(height: 16),
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
                padding: const EdgeInsets.all(24), child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      PlainTextField(
                          textEditingController: firstname,
                          textFieldTitle: 'First Name'),
                      const SizedBox(height: 5),
                      PlainTextField(
                          textEditingController: lastname,
                          textFieldTitle: 'Last Name'),
                      const SizedBox(height: 5),
                      PlainTextField(
                          textEditingController: emailController11,
                          textFieldTitle: 'Enter Your email'),
                      const SizedBox(height: 5),
                      PlainTextField(
                          textEditingController: enterphoneno,
                          textFieldTitle: 'Phone #'),
                      const SizedBox(height: 5), TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () async {
                          filePickerResult = await FilePicker.platform.pickFiles(allowMultiple: true);

                          if (filePickerResult != null) {
                            List<File> files = filePickerResult!.paths.map((path) => File(path!)).toList();
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text(
                          'Upload Docs',
                          style: TextStyle(
                            color: AppColors
                                .blueButtonColor, // this is for your text colour
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      PasswordTextField(
                          textEditingController: passwordController11,
                          textFieldTitle: 'Password'),
                      const SizedBox(height: 5),
                      PasswordTextField(
                          textEditingController: confirmpassword,
                          textFieldTitle: 'Confirm Password'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          builder: (context) => ForgetPassword( email: emailController11.text,)));
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  child: Text('SIGN UP',
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: "Montserrat",
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                onPressed: (){
                                 /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VendorHomeScreen()));*/

                                  SignUpVendorRequest signUpVendorRequest = new SignUpVendorRequest(first_name: firstname.text, last_name: lastname.text, phone_number: enterphoneno.text, email: emailController11.text, password: confirmpassword.text, device_token: "123", device_name: "Android", role: "foodtrucker", latitude: "-1",longitude:"-1");
                                  signUpVendorRequest.docs = filePickerResult?.files;
                                  _determinePositionAndRequestSignup(signUpVendorRequest);
                                },
                              )

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  void _determinePositionAndRequestSignup(SignUpVendorRequest signUpVendorRequest) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions. Please enable from settings');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position loc = (await Geolocator.getCurrentPosition()) as Position;
    signUpVendorRequest.latitude = loc.latitude.toString();
    signUpVendorRequest.longitude = loc.longitude.toString();
    _validateInput(signUpVendorRequest);
    return ;
  }
}
