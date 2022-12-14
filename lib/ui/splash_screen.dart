import 'package:flutter/material.dart';
import 'package:untitled1/ui/main.dart';
import 'package:untitled1/values/images.dart';
import 'package:get/get.dart';


//https://github.com/nisrulz/flutter-examples
//all flutter best example

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.to(const MyApp());
    });
    super.initState();
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Image(
          image: AssetImage(ic_splash),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
