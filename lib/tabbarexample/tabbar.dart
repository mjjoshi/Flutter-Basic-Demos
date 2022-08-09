import 'package:flutter/material.dart';
import 'package:untitled1/values/strings_name.dart';

//https://api.flutter.dev/flutter/material/TabBar-class.html
//https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/

// void main() {
//   runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false, home: TabbarExample()));
// }

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(strings_name.str_tabbar_widget),
          bottom: const TabBar(
            //which is used to display the Tab that corresponds to each page of the TabBarView.
            indicatorColor: Colors.amber,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 10,
            // indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50.0),
            //     color: Colors.greenAccent),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
                text: strings_name.str_cloud,
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: strings_name.str_umbrella,
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
                text: strings_name.str_settings,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          //which displays page views that correspond to each tab.
          children: <Widget>[
            Center(
              child: Text(strings_name.str_cloudy_here),
            ),
            Center(
              child: Text(strings_name.str_rainy_here),
            ),
            Center(
              child: Text(strings_name.str_sunny_here),
            ),
          ],
        ),
      ),
    );
  }
}
