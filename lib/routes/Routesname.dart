import 'package:drawing_app/routes/route.dart';
import 'package:drawing_app/screen/bannerpage.dart';
import 'package:drawing_app/screen/Signin.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.Signin:
        return MaterialPageRoute(builder: (context) => const Signin());
      // case RouteName.landingpage:
      //   return MaterialPageRoute(builder: (context) => const landingpage());
      case RouteName.Homepage:
        return MaterialPageRoute(builder: (context) => const Homepage());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No Route found"),
            ),
          );
        });
    }
  }
}
