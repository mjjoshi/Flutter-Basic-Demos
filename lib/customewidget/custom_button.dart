import 'package:flutter/material.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Function() click;

  const CustomButton(
      {required this.text,
      required this.click,
      this.fontSize = 18,
      this.color = Colors.white,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w700});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: widget.click,
        style: ElevatedButton.styleFrom(
          primary: colors_name.colorblue,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5.0,
        ),
        child: Text(
          widget.text,
          textAlign: widget.textAlign,
          style: TextStyle(
              fontSize: 18, color: widget.color, fontWeight: widget.fontWeight),
        ),
      ),
    );
  }
}
