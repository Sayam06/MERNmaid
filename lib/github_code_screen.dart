import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class GithubCodeScreen extends StatefulWidget {
  static const routeName = "/github-code-screen";
  // int counter = 0;
  // int test = 0;
  bool isLoading = true;

  @override
  _GithubCodeScreenState createState() => _GithubCodeScreenState();
}

class _GithubCodeScreenState extends State<GithubCodeScreen> {
  late Map loginData;

  bool buttonPress = false;
  bool browserOpened = false;
  // int counter = 0;

  void getCode() async {
    setState(() {
      widget.isLoading = true;
    });

    String url = "https://github.com/login/device/code?client_id=ede90c786f56bc4ee447";

    http.Response response = await http.post(Uri.parse(url), headers: {"Accept": "application/json"});
    loginData = json.decode(response.body);
    print(loginData);

    setState(() {
      widget.isLoading = false;
    });
  }

  void initState() {
    super.initState();

    getCode();
  }

  void customLaunch(command) async {
    await launch(command);
  }

  BoxDecoration unpressedButtonDecoration = BoxDecoration(
      // color: Colors.black,
      color: Color.fromRGBO(239, 238, 238, 1),
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          blurRadius: 6.0,
          offset: Offset(-4, -4),
        ),
        BoxShadow(
          color: Color.fromRGBO(209, 205, 199, 0.5),
          blurRadius: 7.0,
          offset: Offset(3, 3),
        ),
      ]);
  BoxDecoration pressedButtonDecoration = BoxDecoration(
      // color: Colors.black,
      color: Color.fromRGBO(239, 238, 238, 1),
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          blurRadius: 7.0,
          offset: Offset(3, 3),
        ),
        BoxShadow(
          color: Color.fromRGBO(209, 205, 199, 0.5),
          blurRadius: 6.0,
          offset: Offset(-4, -4),
        ),
      ]);

  void activateTimer() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        browserOpened = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading == true) {
      getCode();
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 239, 1),
        body: SafeArea(
          child: widget.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(247, 140, 140, 1),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "MERNmaid",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "SFPro",
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: <Color>[
                                          // Colors.black,
                                          Color.fromRGBO(255, 41, 41, 1),
                                          Color.fromRGBO(255, 130, 103, 0.6),
                                        ],
                                      ).createShader(Rect.fromLTWH(35, 0.0, 300.0, 70.0))),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              // color: Colors.black,
                              color: Color.fromRGBO(239, 238, 238, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  blurRadius: 6.0,
                                  offset: Offset(-4, -4),
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(209, 205, 199, 0.5),
                                  blurRadius: 7.0,
                                  offset: Offset(3, 3),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Container(
                      child: Text(
                        "Your GitHub code is:",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontSize: 28,
                          color: Color.fromRGBO(135, 135, 135, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        loginData["user_code"],
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontSize: 40,
                          color: Color.fromRGBO(247, 140, 140, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    browserOpened == false
                        ? Container(
                            child: Text(
                              "Click below to enter code",
                              style: TextStyle(
                                fontFamily: "ProductSans",
                                fontSize: 27,
                                color: Color.fromRGBO(135, 135, 135, 1),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 240,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          browserOpened == false
                              ? GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      buttonPress = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    customLaunch("https://github.com/login/device");

                                    setState(() {
                                      buttonPress = false;
                                    });
                                    activateTimer();
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      buttonPress = false;
                                    });
                                  },
                                  child: Text(
                                    "Open browser",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "ProductSans",
                                      color: Color.fromRGBO(247, 140, 140, 1),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      buttonPress = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    Navigator.pushNamed(context, '/github_verification_screen', arguments: {"device_code": loginData["device_code"]});
                                    setState(() {
                                      buttonPress = false;
                                    });
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      buttonPress = false;
                                    });
                                  },
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "ProductSans",
                                      color: Color.fromRGBO(247, 140, 140, 1),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      decoration: buttonPress ? pressedButtonDecoration : unpressedButtonDecoration,
                    )
                  ],
                ),
        ));
  }
}
