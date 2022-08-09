import 'package:flutter/material.dart';
import 'package:untitled1/values/colors_name.dart';
import 'package:untitled1/values/strings_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom_Card extends StatefulWidget {
  final String text;
  final Color colors;
  final String textDescription;
  final String bundle;
  final Function() click;

  const custom_Card(
      {required this.text,
      required this.textDescription,
      required this.bundle,
      required this.click,
      this.colors = colors_name.textcolorcustomer});

  @override
  State<custom_Card> createState() => _custom_Card();
}

class _custom_Card extends State<custom_Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          onTap: widget.click,
          child: Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  padding:
                      const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.text,
                        style: const TextStyle(
                            color: colors_name.textcolorcustomer,
                            fontSize: 24,
                            fontFamily: strings_name.str_font_name,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          widget.textDescription,
                          style: const TextStyle(
                              color: colors_name.textcolorcustomer,
                              fontSize: 14,
                              fontFamily: strings_name.str_font_name,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
              Image.asset(
                widget.bundle,
                width: 200.0,
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
