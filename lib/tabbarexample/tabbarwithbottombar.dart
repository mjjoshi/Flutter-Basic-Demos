import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false, home: TabbarwithBottom()));
// }

class TabbarwithBottom extends StatefulWidget {
  const TabbarwithBottom({Key? key}) : super(key: key);

  @override
  State<TabbarwithBottom> createState() => _TabbarwithBottomState();
}

class _TabbarwithBottomState extends State<TabbarwithBottom> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(title: const Text("Tab bar with bottom")),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
        bottomNavigationBar: const Material(
          color: Colors.amber,
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 10,
            tabs: [
              Tab(
                icon: Icon(Icons.access_alarm),
                text: "ONE",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "TWO",
              ),
              Tab(
                icon: Icon(Icons.add_box),
                text: "THREE",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
