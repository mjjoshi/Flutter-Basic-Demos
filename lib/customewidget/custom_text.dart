import 'package:flutter/material.dart';
import 'package:untitled1/values/strings_name.dart';

class custom_text extends StatefulWidget {
  final String text;
  final Color color;
  final double size;
  final double topValue;
  final FontWeight fontWeight;
  final Alignment alignment;

  custom_text(
      {required this.text,
      this.color = Colors.black,
      required this.size,
      required this.fontWeight,
      this.alignment = Alignment.topLeft,
      this.topValue = 10.0});

  @override
  State<custom_text> createState() => _custom_textState();
}

class _custom_textState extends State<custom_text> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topValue, left: 20, right: 20),
      alignment: widget.alignment,
      child: Text(
        widget.text,
        style: TextStyle(
            color: widget.color,
            fontSize: widget.size,
            fontFamily: strings_name.str_font_name,
            fontWeight: widget.fontWeight),
      ),
    );
  }
}
