import 'dart:async';
import 'dart:developer';
import 'package:chit_app/screens/global/view/global_screen.dart';
import 'package:chit_app/screens/login/view/login_screen.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider() {
    isLogged();
  }

  isLogged() async {
    final loginDb = await Hive.openBox("login_box");
    final isLogged = loginDb.containsKey(1);
    if (isLogged) {
      log(loginDb.keys.toString());
      Timer(const Duration(seconds: 3),
          () => RoutesManager.removeScreen(screen: const GlobalScreen()));
    } else {
      log(loginDb.keys.toString());
      Timer(const Duration(seconds: 3),
          () => RoutesManager.removeScreen(screen: const LoginScreen()));
    }
  }
}
