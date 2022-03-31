class ForgotPasswordResponse {
  var code;
  var title;
  var message;
  // final String token;

  ForgotPasswordResponse({
    required this.message,
    // required this.token,
    required this.code,
    required this.title
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'],
      code: json['code'],
      title: json['title']
    );
  }
}
