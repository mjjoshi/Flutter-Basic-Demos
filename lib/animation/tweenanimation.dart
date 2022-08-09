import 'package:flutter/material.dart';
import 'package:untitled1/customewidget/custom_text.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: TweenAnimation()));
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;
  late Animation<Offset> _animOffset;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation4();
    //animation1();
    // Rebuilding the screen when animation goes ahead
    controller?.addListener(() {
      setState(() {});
    });

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller?.repeat(reverse: true);
  }

  void animation1() {
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller!);
    sizeAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(controller!);
    controller?.repeat();
  }

  void animation2() {
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.bounceOut));
    sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0.0, 0.5)));
    controller?.forward();
  }

  void animation3() {
    sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 75.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 75.0, end: 0.0), weight: 1),
      ],
    ).animate(controller!);
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0.5, 1.0)));
    controller?.repeat(reverse: true);
  }

  void animation4() {
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: controller!);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.50), end: Offset.zero)
            .animate(curve);
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Demo"),
      ),
      body: Column(
        children: [
          Container(
            height: sizeAnimation?.value,
            width: sizeAnimation?.value,
            color: colorAnimation?.value,
          ),
          FadeTransition(
            opacity: controller!,
            child: SlideTransition(
              position: _animOffset,
              child: custom_text(
                  text: "Try something new",
                  size: 16,
                  fontWeight: FontWeight.w700,
                  alignment: Alignment.center),
            ),
          ),
        ],
      ),
    );
  }
}
