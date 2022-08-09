import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/customewidget/custom_button.dart';
import 'package:untitled1/customewidget/custom_text.dart';
import 'package:untitled1/ui/signup.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:untitled1/values/images.dart';
import 'package:untitled1/values/strings_name.dart';
import '../customewidget/custom_edittext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/utils/utils.dart';

void main() {
  runApp(const GetMaterialApp(debugShowCheckedModeBanner: false, home: Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// Scaffold will provide a framework to implement the basic material design layout of the application.
class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    utils.launchWebView();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      colors_name.newGradientStart,
                      colors_name.newGradientMiddle,
                      colors_name.newGradientEnd
                    ])),
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
                child: Container(
                  margin: const EdgeInsets.only(top: 155),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 9,
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      custom_text(
                          text: strings_name.str_login,
                          size: 30,
                          fontWeight: FontWeight.w700,
                          topValue: 20.0),
                      custom_text(
                          text: strings_name.str_continue_account,
                          size: 20,
                          color: colors_name.colorgraylight,
                          fontWeight: FontWeight.w500,
                          topValue: 10.0),
                      custom_text(
                        text: strings_name.str_email,
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      custom_edittext(
                        hintText: strings_name.str_hint_email,
                        type: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                      ),
                      custom_text(
                          text: strings_name.str_password,
                          size: 16,
                          fontWeight: FontWeight.w600),
                      custom_edittext(
                        hintText: strings_name.str_hint_password,
                        type: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscure: true,
                        controller: passController,
                      ),
                      custom_text(
                          text: strings_name.str_forgot_password,
                          size: 14,
                          color: colors_name.textcolorcustomer,
                          fontWeight: FontWeight.w700,
                          alignment: Alignment.topRight),
                      CustomButton(
                        click: () {
                          Get.to(const SignUp());
                        },
                        text: strings_name.str_login,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                            text: const TextSpan(
                                text: strings_name.str_dont_have_account,
                                style: TextStyle(
                                    color: colors_name.colorgraylight,
                                    fontSize: 14,
                                    fontFamily: strings_name.str_font_name,
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                              TextSpan(
                                text: strings_name.str_signup,
                                style: TextStyle(
                                    color: colors_name.textcolorcustomer,
                                    fontSize: 14,
                                    fontFamily: strings_name.str_font_name,
                                    fontWeight: FontWeight.w700),
                              )
                            ])),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
