import 'package:flutter/material.dart';
import 'package:mernmaid/google_signin_api.dart';

class Home extends StatelessWidget {
  static const routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RaisedButton(
          onPressed: () => {},
          child: Text("logout"),
        ),
      ),
    );
  }
}
