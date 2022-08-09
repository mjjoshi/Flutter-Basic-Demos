import 'package:flutter/material.dart';
import 'package:untitled1/tabbarexample/tabbar.dart';
import 'package:untitled1/tabbarexample/tabbarbottomnavigation.dart';
import 'package:untitled1/tabbarexample/tabbarwithbottombar.dart';
import 'package:untitled1/tabbarexample/tabbarwithcontroller.dart';

//routes example done
//An app has to display multiple screens depending upon the user's needs. A user needs to back and forth from the multiple screens to the home screen. In, Flutter this is done with the help of Navigator.
//Note: In Flutter, screens and pages are called routes.
class Routes {
  static const String tabbar = "/tabbar";
  static const String tabbarBottomNavigation = "/tabbarBottomNavigation";
  static const String tabbarBottomBar = "/tabbarBottomBar";
  static const String tabbarController = "/tabbarController";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.tabbar:
        return MaterialPageRoute(builder: (_) => const TabbarExample());
      case Routes.tabbarBottomNavigation:
        return MaterialPageRoute(
            builder: (_) => const TabbarwithBottomNavigation());
      case Routes.tabbarBottomBar:
        return MaterialPageRoute(builder: (_) => const TabbarwithBottom());
      case Routes.tabbarController:
        return MaterialPageRoute(builder: (_) => const TabbarWithController());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No route found"),
              ),
              body: const Center(
                child: Text("No route found"),
              ),
            ));
  }
}
