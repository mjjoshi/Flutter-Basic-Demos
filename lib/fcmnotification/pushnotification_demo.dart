import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MaterialApp(home: PushNotificationDemo()));
}

class PushNotificationDemo extends StatefulWidget {
  const PushNotificationDemo({Key? key}) : super(key: key);

  @override
  State<PushNotificationDemo> createState() => _PushNotificationDemoState();
}

class _PushNotificationDemoState extends State<PushNotificationDemo> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PushNotiifcation demo")),
    );
  }
}
