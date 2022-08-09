import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled1/customewidget/custom_text.dart';


void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: TickerAnimation()));
}

//in ticker no need to set explicit duration . in timer add explicit duration.
class TickerAnimation extends StatefulWidget {
  const TickerAnimation({Key? key}) : super(key: key);

  @override
  State<TickerAnimation> createState() => _TickerAnimationState();
}

class _TickerAnimationState extends State<TickerAnimation>
    with SingleTickerProviderStateMixin {
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    // 3. initialize Ticker
    _ticker = createTicker((elapsed) {
      // 4. update state
      setState(() {
        _elapsed = elapsed;
        print("timer==> $_elapsed");
      });
    });
    // 5. start ticker
    _ticker.start();
  }

  @override
  void dispose() {
    // 6. don't forget to dispose it
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticker Animation Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: custom_text(
            text: _printDuration(_elapsed), size: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

}
