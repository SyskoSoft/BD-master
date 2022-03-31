import 'dart:async';
import 'dart:convert';

import 'package:food_truck_flutter_app/models/forgot_password_response.dart';
import 'package:food_truck_flutter_app/models/get_notification_request.dart';
import 'package:food_truck_flutter_app/models/sign_up_request.dart';
import 'package:food_truck_flutter_app/models/sign_up_response.dart';
import 'package:food_truck_flutter_app/models/user.dart';
import 'package:food_truck_flutter_app/models/vendor/sign_up_vendor_request.dart';
import 'package:food_truck_flutter_app/models/vendor/sign_up_vendor_response.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_profile_response.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_update_request.dart';
import 'package:food_truck_flutter_app/models/vendor/vendor_update_response.dart';
import 'package:http/http.dart' as http;
import 'package:food_truck_flutter_app/models/login_response.dart';
import 'package:http/http.dart';

import '../models/get_notification_response.dart';

class WebServiceManager {
  static const String baseUrl =
      'https://demolinkweb2.com/foodtrucks/api/';
  static const String registerEndpoint = 'user-register';
  static const String loginEndpoint = 'user-login';
  static const String forgetPasswordEndpoint = 'forgot-password';
  static const String verifyOTPEndpoint = 'verifyresetpasswordcode';
  static const String resetPasswordEndpoint = 'resetpassword';
  static const String signupVendorEndpoint = 'foodtruck-register';
  static const String getVendorProfileEndpoint = 'user-profile';
  static const String updateVendorEndpoint = 'update-profile';
  static const String getNotificationsEndpoint = 'notifications';

  static Future<LoginResponse> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl + loginEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'device_token': "123",
        'device_name': "Samsung"
      }),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      loginResponse.code = response.statusCode.toString();
      return loginResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<ForgotPasswordResponse> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse(baseUrl + forgetPasswordEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );

    if (response.statusCode == 200) {
      return ForgotPasswordResponse.fromJson(jsonDecode(response.body));
    } else {
      var forgotPasswordResponse =
          ForgotPasswordResponse.fromJson(jsonDecode(response.body));
      forgotPasswordResponse.code = response.statusCode.toString();
      return forgotPasswordResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    final response = await http.post(
      Uri.parse(baseUrl + forgetPasswordEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'first_name': signUpRequest.first_name,
        'last_name': signUpRequest.last_name,
        'phone_number': signUpRequest.phone_number,
        'email': signUpRequest.email,
        'password': signUpRequest.password,
        'device_token': signUpRequest.device_token,
        'device_name': signUpRequest.device_name,
        'role': signUpRequest.role,
        'latitude': signUpRequest.latitude,
        'longitude': signUpRequest.longitude
      }),
    );

    if (response.statusCode == 200) {
      return SignUpResponse.fromJson(jsonDecode(response.body));
    } else {
      var signUpResponse = SignUpResponse.fromJson(jsonDecode(response.body));
      signUpResponse.code = response.statusCode.toString();
      return signUpResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<SignUpResponse> signUpVendor(
      SignUpVendorRequest signUpRequest) async {
    final request = await http.MultipartRequest(
        "POST", Uri.parse(baseUrl + signupVendorEndpoint));
    request.fields['first_name'] = signUpRequest.first_name;
    request.fields['last_name'] = signUpRequest.last_name;
    request.fields['phone_number'] = signUpRequest.phone_number;
    request.fields['email'] = signUpRequest.email;
    request.fields['password'] = signUpRequest.password;
    request.fields['device_token'] = signUpRequest.device_token;
    request.fields['device_name'] = signUpRequest.device_name;
    request.fields['role'] = signUpRequest.role;
    request.fields['latitude'] = signUpRequest.latitude;
    request.fields['longitude'] = signUpRequest.longitude;

    if (signUpRequest.docs != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'picture', signUpRequest.docs!.first.path!));
    }

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    /*final response = await http.post(
      Uri.parse(baseUrl + signupVendorEndpoint),
      headers: <String, String>{
        'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>
      {
        'first_name': signUpRequest.first_name,
        'last_name': signUpRequest.last_name,
        'phone_number': signUpRequest.phone_number,
        'email': signUpRequest.email,
        'password': signUpRequest.password,
        'device_token': signUpRequest.device_token,
        'device_name': signUpRequest.device_name,
        'role': signUpRequest.role,
        'latitude': signUpRequest.latitude,
        'longitude': signUpRequest.longitude
      }
      ),
    );*/

    if (response.statusCode == 200) {
      return SignUpResponse.fromJson(jsonDecode(respStr));
    } else {
      var signUpResponse = SignUpResponse.fromJson(jsonDecode(respStr));
      signUpResponse.code = response.statusCode.toString();
      return signUpResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<VendorProfileResponse> getVendorProfile(User user) async {
    final response = await http.get(
        Uri.parse(baseUrl + getVendorProfileEndpoint),
        headers: <String, String>{
          if (user.token != null) 'token': user.token.toString(),
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      return VendorProfileResponse.fromJson(jsonDecode(response.body));
    } else {
      var signUpResponse =
          VendorProfileResponse.fromJson(jsonDecode(response.body));
      signUpResponse.code = response.statusCode.toString();
      return signUpResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<VendorUpdateResponse> updateVendorProfile(
      VendorUpdateRequest vendorUpdateRequest, String token) async {
    final request = await http.MultipartRequest(
      "POST",
      Uri.parse(baseUrl + updateVendorEndpoint),
    );

    request.headers.addAll({"token": token});

    request.fields['first_name'] = vendorUpdateRequest.first_name;
    request.fields['last_name'] = vendorUpdateRequest.last_name;
    request.fields['phone_number'] = vendorUpdateRequest.phone_number;
    request.fields['email'] = vendorUpdateRequest.email;

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return VendorUpdateResponse.fromJson(jsonDecode(respStr));
    } else {
      var vendorUpdateResponse =
          VendorUpdateResponse.fromJson(jsonDecode(respStr));
      vendorUpdateResponse.code = response.statusCode.toString();
      return vendorUpdateResponse;
      //throw Exception('Invalid email or password.');
    }
  }

  static Future<GetNotificationResponse> getNotifications(GetNotificationRequest getNotificationRequest) async {
    String tok = User.currentUser.token!;
    final response = await http.post(
      Uri.parse(baseUrl + getNotificationsEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'token': User.currentUser.token!,
      },
      body: jsonEncode(<String, String>
      {
        'for': getNotificationRequest.foodTruckType,
        'page_no': getNotificationRequest.pageNo
      }
      ),
    );

    if (response.statusCode == 200) {
      return GetNotificationResponse.fromJson(jsonDecode(response.body));
    } else {
      var getNotificationResponse = GetNotificationResponse.fromJson(jsonDecode(response.body));
      getNotificationResponse.code = response.statusCode.toString();
      return getNotificationResponse;
      //throw Exception('Invalid email or password.');
    }
  }
}
