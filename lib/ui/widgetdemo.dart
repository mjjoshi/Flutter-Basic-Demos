import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: WidgetDemo()));
}

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({Key? key}) : super(key: key);

  @override
  State<WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 50,
                left: 10,
                child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.green,
                    margin: const EdgeInsets.all(20)),
              ),
              Container(
                width: 250,
                height: 170,
                color: Colors.red,
              ),
              Container(
                width: 220,
                height: 150,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Stack(
    //       children: <Widget>[
    //         Positioned(
    //           top: 30,
    //           left: 30,
    //           height: 250,
    //           width: 250,
    //           child: Container(
    //             width: 150,
    //             height: 150,
    //             color: Colors.green[300],
    //             child: const Text(
    //               'Green',
    //               style: TextStyle(color: Colors.white, fontSize: 20),
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: 60,
    //           left: 80,
    //           width: 250,
    //           height: 250,
    //           child: Container(
    //             width: 150,
    //             height: 150,
    //             color: Colors.red[400],
    //             child: const Text(
    //               'Red',
    //               style: TextStyle(color: Colors.white, fontSize: 20),
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: 130,
    //           left: 90,
    //           width: 250,
    //           height: 250,
    //           child: Container(
    //             width: 150,
    //             height: 150,
    //             color: Colors.purple[400],
    //             alignment: Alignment.center,
    //             child: const Text(
    //               'purple',
    //               style: TextStyle(color: Colors.white, fontSize: 20),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             //Expanded changes the constraints of a child widget so it fills any empty space.Expanded widget is a specialised Flexible widget with a set fit - Flexible
    //             Expanded(
    //               flex: 1,
    //               child: Container(
    //                 width: 50,
    //                 height: 50,
    //                 color: Colors.teal,
    //               ),
    //             ),
    //             const Spacer(),
    //             //this is example of spacer
    //             Expanded(
    //               flex: 2,
    //               child: Container(
    //                 width: 50,
    //                 height: 50,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             const SizedBox(width: 5),
    //             //this is example of sizebox
    //             Expanded(
    //               flex: 3,
    //               child: Container(
    //                 width: 50,
    //                 height: 50,
    //                 color: Colors.amber,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(width: 10, height: 10),
    //         Row(
    //           children: [
    //             //Flexible makes the child widget flexible and resizable
    //             Flexible(
    //               fit: FlexFit.loose,
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 40,
    //                 color: Colors.yellowAccent,
    //               ),
    //             ),
    //             const SizedBox(width: 5),
    //             Flexible(
    //               flex: 2,
    //               fit: FlexFit.loose,
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 40,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             const SizedBox(width: 5),
    //             Flexible(
    //               fit: FlexFit.loose,
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 40,
    //                 color: Colors.brown,
    //               ),
    //             )
    //           ],
    //         ),
    //         const SizedBox(width: 10, height: 10),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
