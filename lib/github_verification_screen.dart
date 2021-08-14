import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mernmaid/dashboard/screens/home.dart';

class GitHubVerificationScreen extends StatefulWidget {
  static const routeName = "/github-verification";

  @override
  _GitHubVerificationScreenState createState() => _GitHubVerificationScreenState();
}

class _GitHubVerificationScreenState extends State<GitHubVerificationScreen> {
  late var device_code;
  late var token;
  late var data;
  late var userData;

  void postData() async {
    final String url = "https://mernmaid.herokuapp.com/auth/android/github";
    final response = await http.post(Uri.parse(url), body: {
      "username": userData["name"],
      "githubId": userData["id"].toString(),
    });
    print("data added!!!");
    Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (r) => false);
    // Navigator.of(context).popUntil();
    // Navigator.of(context).pushReplacementNamed(Home.routeName);
  }

  void getUserData() async {
    String url = "https://api.github.com/user";
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    userData = json.decode(response.body);
    print(userData);
    if (userData != null) {
      postData();
    }
  }

  void checkKey(var code) async {
    String url = "https://github.com/login/oauth/access_token?client_id=ede90c786f56bc4ee447&device_code=" + code + "&grant_type=urn:ietf:params:oauth:grant-type:device_code";
    http.Response response = await http.post(Uri.parse(url), headers: {"Accept": "application/json"});
    data = json.decode(response.body);
    token = data["access_token"];
    print(token);
    if (token != null) {
      getUserData();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null)
      return SizedBox();
    else {
      final routeArgs = route.settings.arguments as Map<dynamic, dynamic>;
      device_code = routeArgs["device_code"];
      print(device_code);
      checkKey(device_code);
      return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 239, 1),
      );
    }
  }
}
