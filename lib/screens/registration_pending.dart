import 'package:flutter/material.dart';
import 'package:food_truck_flutter_app/widgets/buttons/main_button.dart';
import 'package:food_truck_flutter_app/widgets/buttons/variant_3_button.dart';

import 'home_screen.dart';

class RegistrationPending extends StatelessWidget {
  const RegistrationPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Registration Pending.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: MainButton(
                    buttonText: 'CONTINUE AS GUEST',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                  ),
                ),
                Variant3Button(
                  buttonText: 'CANCEL',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
