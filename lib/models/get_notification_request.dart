class GetNotificationRequest {
  String foodTruckType;//"For 1= customer, 2= foodtrucker , 3= event_organizer , 4= admin	"
  String pageNo;

  GetNotificationRequest({
  required this.foodTruckType,
  required this.pageNo
  });
}
