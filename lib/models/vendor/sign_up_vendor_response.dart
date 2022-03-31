class SignUpVendorResponse {
  var code;
  var title;
  var message;
  // final String token;

  SignUpVendorResponse({
    required this.message,
    // required this.token,
    required this.code,
    required this.title
  });

  factory SignUpVendorResponse.fromJson(Map<String, dynamic> json) {
    return SignUpVendorResponse(
      message: json['message'],
      // token: json['token.token'],
      code: json['code'],
      title: json['title']
    );
  }
}
