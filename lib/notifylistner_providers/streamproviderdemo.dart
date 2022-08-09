import 'package:flutter/material.dart';

//constant value  update



class StreamProviderDemo extends StatefulWidget {
  const StreamProviderDemo({Key? key}) : super(key: key);

  @override
  _StreamProviderDemoState createState() => _StreamProviderDemoState();
}

class _StreamProviderDemoState extends State<StreamProviderDemo> {
  int _count = 0; // used by StreamBuilder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFutureBuilder(),
          const SizedBox(height: 24),
          _buildStreamBuilder(),
        ],
      ),
    );
  }

  // constructing FutureBuilder
  Widget _buildFutureBuilder() {
    return Center(
      child: FutureBuilder<int>(
        future: _calculateSquare(10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Square = ${snapshot.data}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  // used by FutureBuilder
  Future<int> _calculateSquare(int num) async {
    await Future.delayed(const Duration(seconds: 15));
    return num * num;
  }

  // constructing StreamBuilder
  Widget _buildStreamBuilder() {
    return Center(
      child: StreamBuilder<int>(
        stream: _stopwatch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Text("Stopwatch = ${snapshot.data}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  // used by StreamBuilder
  Stream<int> _stopwatch() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield _count++;
    }
  }
}
