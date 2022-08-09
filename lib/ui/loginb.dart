import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:untitled1/values/images.dart';
import 'package:untitled1/values/strings_name.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// Scaffold will provide a framework to implement the basic material design layout of the application.
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // borderRadius: BorderRadiusDirectional.only(
              //   bottomStart: Radius.circular(40.0),
              //   bottomEnd: Radius.circular(40.0),
              // ),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colors_name.newGradientStart,
                    colors_name.newGradientMiddle,
                    colors_name.newGradientEnd
                  ]),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                ic_main_logo,
                width: 200.0,
                height: 170.0,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),

            child: Container(
              height: 100.0,
              margin: const EdgeInsets.only(top: 6.0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.topLeft,
                      child: Text(strings_name.str_login,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: strings_name.str_font_name,
                              fontWeight: FontWeight.w700))),
                  Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Container(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// color: Colors.red,
// width: double.infinity,
// height: 100,
// ),
// Container(
// color: Colors.red,
// child: Container(
// width: double.infinity,
// height: 100,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: new BorderRadius.vertical(
// top: Radius.elliptical(40, 40),
// ),
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// colors_name.newGradientStart,
// colors_name.newGradientMiddle,
// colors_name.newGradientEnd
// ]))),
// ),
// ]),
// ),
