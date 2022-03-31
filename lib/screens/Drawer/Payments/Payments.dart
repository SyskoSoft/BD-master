import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

TextEditingController nameController = TextEditingController();
TextEditingController ExpairyController = TextEditingController();
TextEditingController CVVController1 = TextEditingController();

class _PaymentsState extends State<Payments> {
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
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'PAYMENT \nMETHOD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: "Montserrat",
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 230,
              width: MediaQuery.of(context).size.width/1.3,
              child: Image.asset(
                'assets/images/Clip.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Credit Card (Stripe)',
                  style:
                      TextStyle(fontFamily: "RubikRoman-Medium", fontSize: 14),
                ),
                Row(
                  children: [
                    Container(
                        child: Image.asset(
                      'assets/images/Layer 2.png',
                      fit: BoxFit.fill,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: Image.asset(
                      'assets/images/Layer 3.png',
                      fit: BoxFit.fill,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: Image.asset(
                      'assets/images/Layer 4.png',
                      fit: BoxFit.fill,
                    )),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pay with your credit card via Stripe.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "RubikRoman-Regular"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CARD NUMBER',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "RubikRoman-Regular"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Color(0xffD7E6F8),
                      height: 40,
                      child: TextField(
                        controller: ExpairyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:  BorderSide.none
                          ),
                          labelText: '',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'EXPIRY DATE',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "RubikRoman-Regular"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Color(0xffD7E6F8),
                              height: 40,
                              width: MediaQuery.of(context).size.width/3,
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:  BorderSide.none
                                  ),
                                  labelText: '',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'CARD CODE (CVC)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "RubikRoman-Regular"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Color(0xffD7E6F8),
                              width: MediaQuery.of(context).size.width/3,
                              height: 40,
                              child: TextField(
                                controller: CVVController1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:  BorderSide.none
                                  ),
                                  labelText: '',
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Center(
                      child: Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width/2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100
                              ),
                              color: Color(0xffF2B913)
                          ),
                          child: TextButton(

                            child: Center(
                              child: Text('ADD PAYMENT',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Montserrat",
                                    color: Colors.white
                                ),
                              ),
                            ),
                            onPressed: (){

                            },
                          )

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
