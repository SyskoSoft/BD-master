class User {
  String? code;
  String? title;
  String? message;
  String? token;
  var first_name;
  var last_name;
  var phone_number;
  var image;
  var email;
  var password;
  var device_token;
  var device_name;
  var role;
  var latitude;
  var longitude;

  User._privateConstructor();

  static final User currentUser = User._privateConstructor();

  void logoutUser() {
    code = '';
    title = '';
    message = '';
    token = '';
    first_name = '';
    last_name = '';
    phone_number = '';
    image = '';
    email = '';
    password = '';
    device_token = '';
    device_name = '';
    role = '';
    latitude = '';
    longitude = '';
    image = '';
  }
}
