class VendorUpdateResponse {
  var code;
  var title;
  var message;

  VendorUpdateResponse(
      {required this.message, required this.code, required this.title});

  factory VendorUpdateResponse.fromJson(Map<String, dynamic> json) {
    VendorUpdateResponse signUpResponse = VendorUpdateResponse(
        message: json['message'], code: json['code'], title: json['title']);

    return signUpResponse;
  }
}
