class GetNotificationResponse {
  GetNotificationResponse({
    this.code,
    this.title,
    this.message,
    this.data,
  });

  String? code;
  String? title;
  String? message;
  List<Datum>? data;

  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) => GetNotificationResponse(
    code: json["code"],
    title: json["title"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.image,
    this.message,
    this.createAt,
    this.status,
  });

  String? image;
  String? message;
  DateTime? createAt;
  int? status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    image: json["image"],
    message: json["message"],
    createAt: DateTime.parse(json["create_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "message": message,
    "create_at": createAt?.toIso8601String(),
    "status": status,
  };
}
