import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();


  static goToScreen(Widget screen) {
    Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
    // code for navigation to screen
  }
  static goTopushNamed(String rout, {Object? arguments}) {
    Navigator.pushNamed(navKey.currentContext!, rout, arguments: arguments);
  }


  static goToScreenWithReplacement(Widget screen) {
    navKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static goBackFromCurrentScreen() {
    navKey.currentState?.pop();
  }
  static pushAndRemoveUntil(Widget rout) {
    Navigator.pushAndRemoveUntil(navKey.currentContext!, MaterialPageRoute(builder: (context) {
      return rout;
    }), (route) => false);
  }
}