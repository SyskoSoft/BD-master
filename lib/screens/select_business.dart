import 'package:flutter/material.dart';

class SelectBusiness extends StatefulWidget {
  const SelectBusiness({Key? key}) : super(key: key);

  @override
  _SelectBusinessState createState() => _SelectBusinessState();
}

class _SelectBusinessState extends State<SelectBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Select Business'),
      ),
    );
  }
}
