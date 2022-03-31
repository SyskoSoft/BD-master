import 'package:flutter/material.dart';
class OnGoing extends StatefulWidget {
  const OnGoing({Key? key}) : super(key: key);

  @override
  _OnGoingState createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Color(0xfffCECECE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('12',
                    style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    Text('Feb',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text('2022',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('BIRTHDAY PARTY',
                      style: TextStyle(color: Colors.red, fontSize: 16,
                      fontFamily: "Montserrat",),

                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red,),
                        Text('lorem ipsum is dummy of #445 text area ',
                          style: TextStyle(color: Colors.black, fontSize: 12,
                            fontFamily: "Montserrat",),

                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Colors.red,),
                        Text('10 am to 06 pm ',
                          style: TextStyle(color: Colors.black, fontSize: 12,
                            fontFamily: "Montserrat",),

                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Color(0xfffCECECE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('12',
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    Text('Feb',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text('2022',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('WEDDING  PARTY',
                      style: TextStyle(color: Colors.red, fontSize: 16,
                        fontFamily: "Montserrat",),

                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red,),
                        Text('lorem ipsum is dummy of #445 text area ',
                          style: TextStyle(color: Colors.black, fontSize: 12,
                            fontFamily: "Montserrat",),

                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer, color: Colors.red,),
                        Text('10 am to 06 pm ',
                          style: TextStyle(color: Colors.black, fontSize: 12,
                            fontFamily: "Montserrat",),

                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
