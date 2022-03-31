class SignUpRequest {
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

  SignUpRequest({
  required this.first_name,
  required this.last_name,
  required this.phone_number,
  required this.email,
  required this.password,
  required this.device_token,
  required this.device_name,
  required this.role,
  required this.latitude,
  required this.longitude
  });
}
