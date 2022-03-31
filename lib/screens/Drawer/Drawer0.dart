import 'package:flutter/material.dart';

import 'EVENTS/EVENTS.dart';
import 'Notification/Notification.dart';
import 'Profile/Profile.dart';
class Drawer0 extends StatefulWidget {
  const Drawer0({Key? key}) : super(key: key);

  @override
  _Drawer0State createState() => _Drawer0State();
}

class _Drawer0State extends State<Drawer0> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffE30000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(

                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                        Container(
                          child: Image.asset('assets/images/Ellipse 5.png'),),
                          Container(
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel, color: Colors.white,),
                            )
                          ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text('USERNAME',
                        style: TextStyle(
                          color: Colors.white, fontFamily: "Montserrat",
                          fontSize: 24
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Padding(
             padding: const EdgeInsets.only(left: 20, right: 20),
             child: Column(
               children: [
                 SizedBox(
                   height: 30,
                 ),

                 InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => Profile()));
                   },
                   child: Row(
                     children: [
                       Container(
                         child: Image.asset('assets/icons/user.png',fit: BoxFit.fill,),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Text('PROFILE',
                         style: TextStyle(
                             color: Color(0xffE30000), fontFamily: "Montserrat",
                             fontSize: 20
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/icons/Ellipse 9.png',
                  fit: BoxFit.fill,
                  )
                 ),
                 SizedBox(
                   height: 10,
                 ),




//Notification
                 InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) =>  Notification0()));
                   },
                   child: Row(
                     children: [
                       Container(
                         child: Image.asset('assets/icons/bell.png',fit: BoxFit.fill,),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Text('NOTIFICATION',
                         style: TextStyle(
                             color: Color(0xffE30000), fontFamily: "Montserrat",
                             fontSize: 20
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),





//EVENTS
                 InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) =>  EVENTS()));
                   },
                   child: Row(
                     children: [
                       Container(
                         child: Image.asset('assets/icons/calendar (1).png',fit: BoxFit.fill,),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Text('EVENTS',
                         style: TextStyle(
                             color: Color(0xffE30000), fontFamily: "Montserrat",
                             fontSize: 20
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),





                 InkWell(
                   onTap: (){
                     Navigator.pushNamed(context, "Payments");
                   },
                   child: Row(
                     children: [
                       InkWell(

                         child: Container(
                           child: Image.asset('assets/icons/debit-card.png',fit: BoxFit.fill,),
                         ),
                       ),
                       SizedBox(
                         width: 20,
                       ),
                       Text('PAYMENTS',
                         style: TextStyle(
                             color: Color(0xffE30000), fontFamily: "Montserrat",
                             fontSize: 20
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),




                 Row(
                   children: [
                     Container(
                       child: Image.asset('assets/icons/2406873.png',fit: BoxFit.fill,),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Text('SUBSCRIPTIONS',
                       style: TextStyle(
                           color: Color(0xffE30000), fontFamily: "Montserrat",
                           fontSize: 20
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),




                 Row(
                   children: [
                     Container(
                       child: Image.asset('assets/icons/819860.png',fit: BoxFit.fill,),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Text('MENU LISTINGS',
                       style: TextStyle(
                           color: Color(0xffE30000), fontFamily: "Montserrat",
                           fontSize: 20
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),





                 Row(
                   children: [
                     Container(
                       child: Image.asset('assets/icons/address.png',fit: BoxFit.fill,),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Text('LOCATION',
                       style: TextStyle(
                           color: Color(0xffE30000), fontFamily: "Montserrat",
                           fontSize: 20
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),





                 Row(
                   children: [
                     Container(
                       child: Image.asset('assets/icons/1584892.png',fit: BoxFit.fill,),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Text('TIMINGS',
                       style: TextStyle(
                           color: Color(0xffE30000), fontFamily: "Montserrat",
                           fontSize: 20
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),



                 Row(
                   children: [
                     Container(
                       child: Image.asset('assets/icons/order.png',fit: BoxFit.fill,),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Text('IN-APP PURCHASE',
                       style: TextStyle(
                           color: Color(0xffE30000), fontFamily: "Montserrat",
                           fontSize: 20
                       ),
                     )
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.asset('assets/icons/Ellipse 9.png',
                       fit: BoxFit.fill,
                     )
                 ),
                 SizedBox(
                   height: 10,
                 ),


               ],
             ),
           ),
    SizedBox(
        height: 20,
    ),
    Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Setting',
              style: TextStyle(
                  color: Color(0xffE30000), fontFamily: "Montserrat",
                  fontSize: 20
              ),
            ),
            SizedBox(
              height: 20,
            ),


            Text('Terms & Condition / Privacy',
              style: TextStyle(
                  color: Color(0xffF2B913), fontFamily: "Montserrat",
                  fontSize: 15
              ),
            ),
            SizedBox(
              height: 20,
            ),


            Text('Logout',
              style: TextStyle(
                  color: Color(0xffF2B913), fontFamily: "Montserrat",
                  fontSize: 15
              ),
            )
          ],
        ),
    )

          ],
        ),
      ),
    );
  }
}
