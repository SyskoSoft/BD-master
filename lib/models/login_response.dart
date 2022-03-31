class LoginResponse {
  String code;
  String title;
  String message;
  String token;

  LoginResponse({
    required this.message,
    required this.token,
    required this.code,
    required this.title
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      token: json['token']['token'],
      code: json['code'],
      title: json['title']
    );
  }
}
