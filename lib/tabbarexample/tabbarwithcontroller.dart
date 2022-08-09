import 'dart:math';

import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false, home: TabbarWithController()));
// }

class TabbarWithController extends StatefulWidget {
  const TabbarWithController({Key? key}) : super(key: key);

  @override
  State<TabbarWithController> createState() => _TabbarWithControllerState();
}

//SingleTickerProviderStateMixin , TickerProviderStateMixin
//As the name suggests, the SingleTickerProviderStateMixin is used when you only have a single animation controller and the TickerProviderStateMixin is used when you have multiple animation controllers.
//https://api.flutter.dev/flutter/widgets/TickerProviderStateMixin-mixin.html
//When you add your SingleTickerProviderStateMixin, it tells Flutter that there is some animation in this widget and this widget needs to notified about the animation frames of flutter

class _TabbarWithControllerState extends State<TabbarWithController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    //TabController: The TabController is used to control the movement between created tabs. need to do any customisation at that time use tab bar
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: ${_tabController.index}");
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _tabBarView() {
    return AnimatedBuilder(
      animation: _tabController.animation!,
      builder: (BuildContext context, snapshot) {
        return Transform.rotate(
          angle: _tabController.animation!.value * pi,
          child: [
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.lightGreen,
            )
          ][_tabController.animation!.value.round()],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),

          bottom: TabBar(
            controller: _tabController, //changin tab programatically
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: _tabBarView()

    );
  }
}
