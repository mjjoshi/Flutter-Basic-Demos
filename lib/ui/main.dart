import 'package:flutter/material.dart';
import 'package:untitled1/ui/login.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:untitled1/values/images.dart';
import 'package:untitled1/values/strings_name.dart';
import 'package:get/get.dart';
import '../customewidget/custom_card.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _SelectUser();
}

class _SelectUser extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            colors_name.newGradientStart,
            colors_name.newGradientMiddle,
            colors_name.newGradientEnd
          ])),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ic_main_logo,
                    width: 200.0,
                    height: 150.0,
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(strings_name.str_select_user,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: strings_name.str_font_name,
                            fontWeight: FontWeight.w700))),
                Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.topLeft,
                    child: const Text(strings_name.str_select_user_d,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: strings_name.str_font_name,
                            fontWeight: FontWeight.w500))),
                custom_Card(
                  text: strings_name.str_customer,
                  textDescription: strings_name.str_customer_d,
                  bundle: ic_customer,
                  click: () {
                    Get.to(const Login());
                  },
                ),
                custom_Card(
                  text: strings_name.str_business,
                  textDescription: strings_name.str_customer_d,
                  bundle: ic_business,
                  click: () {
                    Get.to(const Login());
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
