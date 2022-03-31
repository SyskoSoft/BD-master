import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/models/user.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_profile_data.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_profile_response.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_update_request.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_update_response.dart';
import 'package:food_truck_flutter_app/providers/web_service_manager.dart';
import 'package:food_truck_flutter_app/widgets/dialogs.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User currentUser = User.currentUser;

  final myControllerName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    _asynGetProfile();
  }

  _asynGetProfile() async {
    try {
      VendorProfileResponse vendorProfileResponse =
          await WebServiceManager.getVendorProfile(currentUser);

      if (vendorProfileResponse.code == "200") {
        User currentUser = User.currentUser;
        currentUser.code = vendorProfileResponse.code;
        currentUser.title = vendorProfileResponse.title;
        currentUser.message = vendorProfileResponse.message;
        VendorProfileData vendorProfile =
            vendorProfileResponse.vendorProfileData;
        currentUser.first_name = vendorProfile.first_name;
        currentUser.last_name = vendorProfile.last_name;
        currentUser.phone_number = vendorProfile.phone_number;
        // var image = signUpRequest.first_name;
        currentUser.email = vendorProfile.email;
        //currentUser.password = signUpRequest.password;
        currentUser.device_token = vendorProfile.device_token;
        currentUser.device_name = vendorProfile.device_name;
        //currentUser.role = vendorProfileResponse.role;
        currentUser.latitude = vendorProfile.latitude;
        currentUser.longitude = vendorProfile.longitude;

        setState(() {});
      } else {
        await Dialogs.showAlertDialog(context, vendorProfileResponse.title,
            vendorProfileResponse.message);
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
          exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(
          context, 'Profile Info Failed', errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/Picture1.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          )),
                      SizedBox(
                        width: 05,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xff707070),
                              ),
                              hintText: 'SEARCH MENU',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xffDFDFDF),
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'assets/images/Ellipse 5.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: 130,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'ABC FOOD TRUCK',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hello Mr.ABC',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "HKGrotesk",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffCFCFCF),
                  child: Center(
                    child: TextFormField(
                      controller: myControllerName,
                      textAlign: TextAlign.start,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xffCFCFCF),
                      decoration: InputDecoration(
                        focusColor: Color(0xffCFCFCF),
                        hoverColor: Color(0xffCFCFCF),
                        labelText: "NAME ",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decorationColor: Colors.black),
                        fillColor: Color(0xffCFCFCF),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                        suffixIcon: Image.asset('assets/icons/edit.png'),
                        hintText: currentUser.first_name.toString(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff414141),
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffCFCFCF),
                  child: Center(
                    child: TextFormField(
                      controller: myControllerEmail,
                      textAlign: TextAlign.start,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xffCFCFCF),
                      decoration: InputDecoration(
                        focusColor: Color(0xffCFCFCF),
                        hoverColor: Color(0xffCFCFCF),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decorationColor: Colors.black),
                        fillColor: Color(0xffCFCFCF),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                        suffixIcon: Image.asset('assets/icons/edit.png'),
                        hintText: currentUser.email.toString(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff414141),
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffCFCFCF),
                  child: Center(
                    child: TextFormField(
                      controller: myControllerPhone,
                      textAlign: TextAlign.start,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xffCFCFCF),
                      decoration: InputDecoration(
                        focusColor: Color(0xffCFCFCF),
                        hoverColor: Color(0xffCFCFCF),
                        labelText: "PHONE",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decorationColor: Colors.black),
                        fillColor: Color(0xffCFCFCF),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                        suffixIcon: Image.asset('assets/icons/edit.png'),
                        hintText: currentUser.phone_number.toString(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff414141),
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/images/Picture12.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Remove image ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change image ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                        Container(
                            height: 43,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xffE30000)),
                            child: TextButton(
                              child: Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                _asynUpdateProfile();
                              },
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _asynUpdateProfile() async {
    try {
      VendorUpdateRequest vendorUpdateRequest = VendorUpdateRequest(
          first_name: myControllerName.text,
          last_name: User.currentUser.last_name.toString(),
          phone_number: myControllerPhone.text.toString(),
          email: myControllerEmail.text.toString(),
          password: User.currentUser.password,
          device_token: User.currentUser.device_token,
          device_name: "Android",
          role: User.currentUser.role,
          latitude: User.currentUser.latitude,
          longitude: User.currentUser.longitude,
          is_online: "1");

      VendorUpdateResponse vendorProfileResponse =
          await WebServiceManager.updateVendorProfile(
              vendorUpdateRequest, User.currentUser.token.toString());

      if (vendorProfileResponse.code == "200") {
        User currentUser = User.currentUser;
        currentUser.code = vendorProfileResponse.code;
        currentUser.title = vendorProfileResponse.title;
        currentUser.message = vendorProfileResponse.message;

        await Dialogs.showAlertDialog(context, vendorProfileResponse.title,
            vendorProfileResponse.message);
      } else {
        await Dialogs.showAlertDialog(context, vendorProfileResponse.title,
            vendorProfileResponse.message);
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
          exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(
          context, 'Update Profile Failed', errorMessage);
    }
  }
}
