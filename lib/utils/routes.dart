import 'package:flutter/material.dart';

class RoutesManager {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static nextScreen({required var screen}) {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeScreen({required var screen}) {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeAllScreen({required var screen}) {
    navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => screen,
        ),
        (route) => false);
  }

  static backScreen() {
    navigatorKey.currentState?.pop();
  }
}
