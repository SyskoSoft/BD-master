import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/screens/Drawer/Drawer0.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();
final Searchbar = TextEditingController();

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer0(),
      backgroundColor: Colors.white,
      body: Column(
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
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                              child: Icon(
                                Icons.format_list_bulleted_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
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
                left: 130,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'ABC FOOD TRUCK',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hello Mr.ABC',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "HKGrotesk",
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 600,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 200,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: Color(0xffF1F2F2),
                      border: Border.all(color: Color(0xffF2B913)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(child: Image.asset(
                                    'assets/images/order.png')),
                                SizedBox(
                                  width: 15,
                                ),

                                Text(
                                  'NOTIFICATIONS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,

                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              Text(
                                'No notifications yet.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,

                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 200,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: Color(0xffF2B913),
                      border: Border.all(color: Color(0xffF2B913)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            color: Color(0xffF9DC89),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(child: Image.asset(
                                    'assets/images/order.png')),
                                SizedBox(
                                  width: 15,
                                ),

                                Text(
                                  'EVENTS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,

                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    'MON',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,

                                    ),
                                  ),
                                  Text(
                                    '12',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 04),
                                    child: Column(
                                      children: [
                                        Text(
                                          'FEB',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '2022',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BIRTHDAY PARTY',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.red,),
                                      Text(
                                        'lorem ipsum is dummy of #445 text area ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 05,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.timer, color: Colors.red,),
                                      Text(
                                        '10 am to 06 pm ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),),

                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 200,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: Color(0xffF1F2F2),
                      border: Border.all(color: Color(0xffF2B913)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(child: Image.asset(
                                    'assets/images/order.png')),
                                SizedBox(
                                  width: 15,
                                ),

                                Text(
                                  'ACCOUNT DETAILS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,

                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            children: [
                              Text(
                                'EDIT YOUR PASSWORD AND ACC DETAILS.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,

                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
