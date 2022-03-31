class UserProfileResponse {
  var code;
  var title;
  var message;
  UserData userData;

  UserProfileResponse({
    required this.message,
    required this.code,
    required this.title,
    required this.userData
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      message: json['message'],
      // token: json['token.token'],
      code: json['code'],
      title: json['title'],
      userData: json['data']
    );
  }
}

class UserData {
  var first_name;
  var last_name;
  var phone_number;
  var email;
  var latitude;
  var longitude;
  var device_token;
  var device_name;
  var is_online;
  var profile_image;
}