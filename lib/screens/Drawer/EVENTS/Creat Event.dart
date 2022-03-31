import 'package:flutter/material.dart';
class CreatEvent extends StatefulWidget {
  const CreatEvent({Key? key}) : super(key: key);

  @override
  _CreatEventState createState() => _CreatEventState();
}

class _CreatEventState extends State<CreatEvent> {
  final _formKey = GlobalKey<FormState>();
  String Regular='Regular';
  var formkey = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
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
              Positioned(
                top: 100,
                left: 130,
                child: Text('CREATE AN\n EVENTS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28, fontFamily: "Montserrat",
                  color: Colors.white
                ),),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      controller: controller1,
                      textAlign: TextAlign.start,
                      //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xffF2F2F2),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 2, color: Color(0xffB9B9B9),
                            )),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(

                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: controller2,
                        textAlign: TextAlign.start,
                        //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xffF2F2F2),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2, color: Color(0xffB9B9B9),
                              )),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: controller3,
                        textAlign: TextAlign.start,
                        //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xffF2F2F2),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2, color: Color(0xffB9B9B9),
                              )),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: controller4,
                        textAlign: TextAlign.start,
                        //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xffF2F2F2),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2, color: Color(0xffB9B9B9),
                              )),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextFormField(
                        controller: controller5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                        //validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xffF2F2F2),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 2, color: Color(0xffB9B9B9),
                              )),
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                      color: Color(0xffE30000),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
    if(_formKey.currentState!.validate()){
    Navigator.pushNamed(context, 'HomeScreen');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CreatEvent()));
    //CreatEvent
    };
    },
                      child: Text(
                        'SUBMIT FOR APPROVAL',
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
          )
        ],
      ),
    );
  }
}
