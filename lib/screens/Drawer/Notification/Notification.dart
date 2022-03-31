import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/models/get_notification_response.dart';

import '../../../models/get_notification_request.dart';
import '../../../providers/web_service_manager.dart';
import '../../../widgets/dialogs.dart';
class Notification0 extends StatefulWidget {
  const Notification0({Key? key}) : super(key: key);

  @override
  _Notification0State createState() => _Notification0State();
}

class _Notification0State extends State<Notification0> {
  GetNotificationResponse? getNotificationResponse;
  bool isTodayGlobal = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/Picture1.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                            child:  InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back, color: Colors.white,)),
                          )),
                      SizedBox(
                        width: 05,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xff707070),
                              ),
                              hintText: 'SEARCH MENU',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xffDFDFDF),
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'assets/images/Ellipse 5.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: 165,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'NOTIFICATION',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              ListView.builder(itemBuilder: (BuildContext context, int index){
                return  Container(
                  height: 129,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffEFEFEF),
                  child: Center(
                    child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         showHeader(index, checkDateToday(getNotificationResponse!.data![index].createAt!))   ,
                                        Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                          Image.network(getNotificationResponse != null ? getNotificationResponse!.data![index].image! : '', width: 50,),
                                          SizedBox(
                                            width: 05,
                                          ),
                                          Text(getNotificationResponse != null ? getNotificationResponse!.data![index].message!: '')
                      ]

                                        )

                                       ],
                    ),
                  ),
                );
              },itemCount: getNotificationResponse != null ? getNotificationResponse!.data!.length : 0, shrinkWrap: true
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Future<void> getNotificationsAPIRequest(GetNotificationRequest getNotificationRequest) async {
    try {
      getNotificationResponse =
      await WebServiceManager.getNotifications(getNotificationRequest);
      if(getNotificationResponse!=null){
        if(getNotificationResponse!.code == "200"){
          setState(() {
            getNotificationResponse!.code = getNotificationResponse!.code;
          });
        }else{
          await Dialogs.showAlertDialog(context, getNotificationResponse!.title!, getNotificationResponse!.message!);
        }
      }
    } catch (e) {
      String exceptionMessage = e.toString();
      String errorMessage =
      exceptionMessage.substring(11, exceptionMessage.length);
      await Dialogs.showAlertDialog(context, 'Failed', errorMessage);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationsAPIRequest(GetNotificationRequest(foodTruckType: "2", pageNo: "1"));
  }

  bool checkDateToday(DateTime dateToCheck) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
      if(aDate == today) {
        return true;
      } else {
        return false;
      }
  }

  Container showHeader(int index, bool isToday){
    String headerTitle = "Today";
    if(!isToday){
      headerTitle = "Older";
    }

    double height = 40;
    if(isToday && isTodayGlobal){
      height = 0;
    }else if(!isToday && !isTodayGlobal){
      height = 40;
    }

          return Container(
             height: height,
             width: MediaQuery.of(context).size.width,
             color: Color(0xffE30000),
             child: Padding(
               padding: const EdgeInsets.only(left: 60),
               child: Row(
                 children: [
                   Text(headerTitle,
                     style: TextStyle(
                         fontSize: 22,
                         color: Colors.white,
                         fontFamily: "Montserrat",
                         fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
             ),
   );

  }

}
