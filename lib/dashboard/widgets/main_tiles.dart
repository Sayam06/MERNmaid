import 'package:flutter/material.dart';

class MainTiles extends StatelessWidget {
  Function func;
  String img;
  String title;

  MainTiles(this.func, this.img, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 170,
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          // color: Colors.black,
          color: Colors.white, //Color.fromRGBO(239, 238, 238, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
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
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                "assets/images/tiles_background.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: Color.fromRGBO(247, 140, 140, 1),
                  child: Container(
                    height: title == "Calendar" ? 30 : 34,
                    child: Image.asset("assets/images/" + img),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    fontSize: 27,
                    color: Color.fromRGBO(247, 140, 140, 1),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
