import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: RandringContent()));
}

class RandringContent extends StatefulWidget {
  const RandringContent({Key? key}) : super(key: key);

  @override
  State<RandringContent> createState() => _RandringContentState();
}

class _RandringContentState extends State<RandringContent> {
  final checked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rending text"),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text(
              'First Widget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (checked)
              const Text(
                'Second Widget',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Randering Content"), centerTitle: true),
    //   body: ListView.builder(
    //     itemCount: 10,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Column(
    //         children: <Widget>[
    //           ListTile(
    //             leading: CircleAvatar(
    //               backgroundColor: getColor(index),
    //             ),
    //             title: const Text("Login"),
    //             subtitle: const Text("Name"),
    //           ),
    //
    //         ],
    //       );
    //     },
    //   ),
    // );
  }

  Color getColor(int selector) {
    if (selector % 2 == 0) {
      return Colors.blue;
    } else {
      return Colors.blueGrey;
    }
  }
}
