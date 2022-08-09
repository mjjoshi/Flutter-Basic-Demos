import 'package:untitled1/customewidget/custom_text.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/values/images.dart';

class custom_topbar extends StatefulWidget {
  final Function() click;
  final String text;
  final String subText;

  const custom_topbar(
      {required this.click, required this.text, this.subText = ""});

  @override
  State<custom_topbar> createState() => _custom_topbarState();
}

class _custom_topbarState extends State<custom_topbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            colors_name.newGradientStart,
            colors_name.newGradientMiddle,
            colors_name.newGradientEnd
          ])),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 10, left: 20),
            child: InkWell(
              onTap: widget.click,
              child: Image.asset(
                ic_arrow,
                width: 20.0,
                height: 20.0,
              ),
            ),
          ),
          custom_text(
            text: widget.text,
            size: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          custom_text(
            text: widget.subText,
            size: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            topValue: 8,
          ),
        ],
      ),
    );
  }
}
