import 'package:flutter/material.dart';

import '../values/images.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: WeatherAnimation()));
}

class WeatherAnimation extends StatefulWidget {
  const WeatherAnimation({Key? key}) : super(key: key);

  @override
  State<WeatherAnimation> createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation>
    with TickerProviderStateMixin {
  late Animation<Offset> position;
  late Animation<double> opacity;
  late AnimationController controller;

  final alphaTween = Tween(begin: 0.0, end: 1.0);

  @override
  initState() {
    super.initState();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    // screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SlideTransition(
        position: position,
        child: FadeTransition(
          opacity: opacity,
          child: Image(
            image: const AssetImage(ic_main_logo),
            width: screenWidth,
            height: screenHeight,
          ),
        ));
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    position = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    opacity = alphaTween.animate(controller);
    controller.forward();
  }
}
