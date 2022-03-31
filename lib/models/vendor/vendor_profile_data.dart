import 'package:flutter/material.dart';

class VendorProfileData {
  String? first_name;
  String? last_name;
  String? phone_number;
  String? email;
  String? latitude;
  String? longitude;
  String? device_token;
  String? device_name;
  int? is_online;
  String? profile_image;

  VendorProfileData(
      {required this.first_name,
      required this.last_name,
      required this.phone_number,
      required this.email,
      required this.latitude,
      required this.longitude,
      required this.device_token,
      required this.device_name,
      required this.is_online,
      required this.profile_image});

  factory VendorProfileData.fromJson(Map<String, dynamic> json) {
    VendorProfileData vendorProfileResponse = VendorProfileData(
        first_name: json['first_name'],
        last_name: json['last_name'],
        phone_number: json['phone_number'],
        email: json['email'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        device_token: json['device_token'],
        device_name: json['device_name'],
        is_online: json['is_online'],
        profile_image: json['profile_image']);

    return vendorProfileResponse;
  }
}
