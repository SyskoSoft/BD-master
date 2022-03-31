import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/screens/Drawer/Payments/Payments.dart';
import 'package:food_truck_flutter_app/screens/Vendor_Modules/VendorHomeScreen.dart';
import 'package:food_truck_flutter_app/screens/home_screen.dart';
import 'package:food_truck_flutter_app/screens/login_screen.dart';
import 'package:food_truck_flutter_app/screens/onboard_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Food Trucks Mobile App',
    theme: ThemeData(
      fontFamily: 'HKGrotesk',
    ),
    home: const OnboardScreen(),
    routes: {
      "VendorHomeScreen": (context) => VendorHomeScreen(),
      "HomeScreen": (context) => HomeScreen(),
      "Payments": (context) => Payments(),
    },
  ));
}