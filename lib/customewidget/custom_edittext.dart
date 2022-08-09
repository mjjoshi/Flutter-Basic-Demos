import 'package:flutter/material.dart';
import 'package:untitled1/values/strings_name.dart';

class custom_edittext extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Color color;
  final double topValue;
  final Alignment alignment;
  final TextInputType type;
  final TextInputAction textInputAction;
  final bool obscure;
  final TextEditingController controller;
  final double size;
  final FontWeight fontWeight;

  custom_edittext(
      {this.labelText = "",
      this.hintText = "",
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.topValue = 10.0,
      required this.type,
      required this.textInputAction,
      this.obscure = false,
      required this.controller,
      this.size = 18,
      this.fontWeight = FontWeight.w700});

  @override
  State<custom_edittext> createState() => _customState();
}

class _customState extends State<custom_edittext> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: widget.topValue),
      alignment: widget.alignment,
      child: TextFormField(
        keyboardType: widget.type,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscure,
        controller: widget.controller,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: widget.labelText,
            hintText: widget.hintText,
            labelStyle: TextStyle(
                color: widget.color,
                fontSize: widget.size,
                fontFamily: strings_name.str_font_name,
                fontWeight: widget.fontWeight),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}
