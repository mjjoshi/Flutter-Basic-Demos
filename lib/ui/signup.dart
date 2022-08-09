import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/customewidget/custom_edittext.dart';
import 'package:untitled1/customewidget/custom_text.dart';
import 'package:untitled1/customewidget/custom_top_bar.dart';
import 'package:untitled1/utils/utils.dart';
import 'package:untitled1/values/images.dart';
import 'package:untitled1/values/strings_name.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController businessController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    utils.launchWebView();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              custom_topbar(
                click: () {
                  Get.back();
                },
                text: strings_name.str_signup,
                subText: strings_name.str_register_account,
              ),
              ClipRect(
                child: Container(
                  margin: const EdgeInsets.only(top: 155),
                  width: MediaQuery.of(context).size.width,
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
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                            radius: 48, // Image radius
                            backgroundColor: Colors.white,
                            child:
                                Image.asset(ic_avatar, width: 80, height: 80)),
                      ),
                      custom_text(
                          text: strings_name.str_attach_logo,
                          size: 16,
                          fontWeight: FontWeight.w700,
                          topValue: 5.0),
                      custom_edittext(
                        labelText: strings_name.str_business_shop_name,
                        type: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: businessController,
                      ),
                      custom_edittext(
                        labelText: strings_name.str_shop_number,
                        type: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: businessController,
                      ),
                      custom_edittext(
                        labelText: strings_name.str_man_email,
                        type: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: businessController,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 20),
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: Colors.grey,
                            child: CountryCodePicker(
                              initialSelection: 'IN',
                              showFlag: false,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: strings_name.str_font_name,
                              ),
                            ),
                          ),
                          Expanded(
                            child: custom_edittext(
                              labelText: strings_name.str_man_phone_number,
                              type: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: phoneController,
                              topValue: 5,
                            ),
                          )
                        ],
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
