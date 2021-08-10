import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/signup";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Shader loginGradient = LinearGradient(
    colors: <Color>[
      // Colors.black,
      Color.fromRGBO(255, 41, 41, 1),
      Color.fromRGBO(255, 130, 103, 0.6),
    ],
  ).createShader(Rect.fromLTWH(35, 0.0, 300.0, 70.0));

  final oauthDecoration = BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(238, 238, 239, 1),
        body: SafeArea(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    "MERNmaid",
                    style: TextStyle(
                      fontFamily: "SFPro",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 340,
                  width: 300,
                  decoration: BoxDecoration(color: Color.fromRGBO(239, 238, 238, 1),
                      // color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          blurRadius: 7.0,
                          offset: Offset(-4, -4),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(209, 205, 199, 0.5),
                          blurRadius: 7.0,
                          offset: Offset(4, 4),
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "signup",
                        style: TextStyle(
                          fontFamily: "SFPro",
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = loginGradient,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 238, 238, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                blurRadius: 2.0,
                                offset: Offset(2, 2),
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(209, 205, 199, 0.5),
                                blurRadius: 2.0,
                                offset: Offset(-3, -3),
                              ),
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Image.asset(
                                "assets/images/user.png",
                              ),
                            ),
                            Expanded(
                              // width: 190,
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                ),
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or phone",
                                    hintStyle: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      color: Color.fromRGBO(174, 174, 174, 1),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      right: 15,
                                      bottom: 7,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 238, 238, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                blurRadius: 2.0,
                                offset: Offset(2, 2),
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(209, 205, 199, 0.5),
                                blurRadius: 2.0,
                                offset: Offset(-3, -3),
                              ),
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Image.asset(
                                "assets/images/password.png",
                              ),
                            ),
                            Expanded(
                              // width: 190,
                              child: TextField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      color: Color.fromRGBO(174, 174, 174, 1),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      right: 15,
                                      bottom: 7,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 230,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        )),
                        child: RaisedButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          color: Colors.transparent,
                          elevation: 0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          onPressed: () {},
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  // Colors.black,
                                  Color.fromRGBO(255, 41, 41, 0.7),
                                  // Color.fromRGBO(255, 41, 41, 0.6),
                                  Color.fromRGBO(255, 41, 41, 0.6),
                                  Color.fromRGBO(255, 130, 103, 0.5),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 88.0,
                                minHeight: 36.0,
                              ), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
