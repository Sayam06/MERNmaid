import 'package:flutter/material.dart';
import 'package:mernmaid/dashboard/widgets/main_tiles.dart';
import 'package:mernmaid/google_signin_api.dart';

class Home extends StatefulWidget {
  static const routeName = "/dashboard";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "Sayam";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, //Color.fromRGBO(238, 238, 239, 1),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: Container(
                              height: 15,
                              child: Image.asset(
                                "assets/images/hamburger.png",
                                color: Colors.black,
                              ),
                            ),
                          ),
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
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(247, 140, 140, 1),
                            child: Container(
                              height: 20,
                              child: Image.asset("assets/images/user_dashboard.png"),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          color: Colors.white, //Color.fromRGBO(239, 238, 238, 1),
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
                          ])),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  "Hey " + name,
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    fontSize: 30,
                    color: Color.fromRGBO(135, 135, 135, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MainTiles(() => {}, "monitor_icon.png", "Meet"),
              SizedBox(
                height: 30,
              ),
              MainTiles(() => {}, "calendar_icon.png", "Calendar"),
              SizedBox(
                height: 30,
              ),
              MainTiles(() => {}, "whiteboard_icon.png", "Whiteboard"),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )));
  }
}
