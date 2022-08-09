import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/customewidget/custom_button.dart';
import 'package:untitled1/tabbarexample/routes_manager.dart';

void main() {
  runApp(const GetMaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
      home: TabbarDemo()));
}

class TabbarDemo extends StatefulWidget {
  const TabbarDemo({Key? key}) : super(key: key);

  @override
  State<TabbarDemo> createState() => _TabbarDemoState();
}

class _TabbarDemoState extends State<TabbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabbar demo")),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              CustomButton(
                  text: "Tabbar",
                  click: () {
                      Get.toNamed(Routes.tabbar);
                    //Navigator.of(context).pushReplacementNamed();
                    // Navigator.pushNamed(context, Routes.tabbar);
                  }),
              CustomButton(
                  text: "Tabbar with controller",
                  click: () {
                    Get.toNamed(Routes.tabbarController);
                  }),
              CustomButton(
                  text: "Tabbar with bottombar",
                  click: () {
                    Get.toNamed(Routes.tabbarBottomBar);
                  }),
              CustomButton(
                  text: "Tabbar with bottomNavigationBar",
                  click: () {
                    Get.toNamed(Routes.tabbarBottomNavigation);
                  }),
            ],
          )),
    );
  }
}
