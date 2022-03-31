import 'package:food_truck_flutter_app/models/vendor/vendor_profile_data.dart';

class VendorProfileResponse {
  var code;
  var title;
  var message;
  var vendorProfileData;

  VendorProfileResponse(
      {required this.message,
      required this.code,
      required this.title,
      required this.vendorProfileData});

  factory VendorProfileResponse.fromJson(Map<String, dynamic> json) {
    VendorProfileResponse vendorProfileResponse = VendorProfileResponse(
        message: json['message'],
        code: json['code'],
        title: json['title'],
        vendorProfileData: VendorProfileData.fromJson(json['data']));

    return vendorProfileResponse;
  }
}
