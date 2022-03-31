class SignUpResponse {
  var code;
  var title;
  var message;
  String? token;

  SignUpResponse({
    required this.message,
    required this.code,
    required this.title
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    SignUpResponse signUpResponse = SignUpResponse(
        message: json['message'],
        code: json['code'],
        title: json['title']
    );
    if(json['data']!=null){
      signUpResponse.token = json['data']['token'];
    }
    return signUpResponse;
  }
}
