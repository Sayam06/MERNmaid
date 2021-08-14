import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 239, 1),
      body: SafeArea(
          child: Center(
        child: Container(
          child: Text("ERROR, PLEASE TRY AGAIN"),
        ),
      )),
    );
  }
}
