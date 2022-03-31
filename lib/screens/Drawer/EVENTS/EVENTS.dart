import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Creat Event.dart';
import 'Tabs/CLOSED.dart';
import 'Tabs/OnGoing.dart';
import 'Tabs/PENDING.dart';

class EVENTS extends StatefulWidget {
  const EVENTS({Key? key}) : super(key: key);

  @override
  _EVENTSState createState() => _EVENTSState();
}

class _EVENTSState extends State<EVENTS> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
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
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          )),
                      SizedBox(
                        width: 05,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.6,
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
                left: 130,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'EVENTS',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Color(0xffE30000),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreatEvent()));
                              //CreatEvent
                            },
                            child: Text(
                              'CREATE EVENT',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  currentIndex==0?
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Color(0xffE30000),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=0);
                          });
                        },
                        child: Text('PENDING',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Montserrat"
                        ),
                        ),
                      ),
                    ),
                  ):
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=0);
                          });
                        },
                        child: Text('PENDING',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  currentIndex==1?
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Color(0xffE30000),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=1);
                          });
                        },
                        child: Text('ON GOING',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ):
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=1);
                          });
                        },
                        child: Text('ON GOING',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  currentIndex==2?
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Color(0xffE30000),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=2);
                          });
                        },
                        child: Text('CLOSED',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ):
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            print(currentIndex=2);
                          });
                        },
                        child: Text('CLOSED',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          currentIndex==0?PENDING():currentIndex==1?OnGoing():currentIndex==2?CLOSED():Container()
        ]));
  }
}
