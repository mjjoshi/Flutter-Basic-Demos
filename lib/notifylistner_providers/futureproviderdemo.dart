import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  Person({required this.name, required this.age});

  final String name;
  int age;
}

class Home {
  final String city = "Portland";
  // The value that will be provided must be a `Future`.
  Future<String> get fetchAddress {
    final address = Future.delayed(const Duration(seconds: 2), () {
      return '1234 North Commercial Ave.';
    });
    return address;
  }
}
class FutureProviderDemo1 extends StatelessWidget {
  const FutureProviderDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<Person>(
            builder: (context, Person person, child) {
              return Column(
                children: <Widget>[
                  const Text("User profile:"),
                  Text("name: ${person.name}"),
                  Text("age: ${person.age}"),
                  Consumer<String>(builder: (context, String address, child) {
                    return Text("address: $address");
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}