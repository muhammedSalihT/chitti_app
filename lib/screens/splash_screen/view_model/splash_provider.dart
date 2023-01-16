import 'dart:async';
import 'package:chit_app/screens/global/view/global_screen.dart';
import 'package:chit_app/screens/login/view/login_screen.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class SplashProvider extends ChangeNotifier {
  List<dynamic> userChittiList = [];
  isLogged() async {
    final loginDb = await Hive.openBox("login_box");
    final isLogged = loginDb.containsKey(1);
    Timer(const Duration(seconds: 3), () {
      if (isLogged) {
        getUserChittList();
        RoutesManager.removeScreen(screen: const GlobalScreen());
      } else {
        RoutesManager.removeScreen(screen: const LoginScreen());
      }
    });
  }

  getUserChittList() async {
    final userChittiDb = await Hive.openBox("chittis");
    final loginDb = await Hive.openBox("login_box");
    userChittiList = await userChittiDb.get(loginDb.get(1));
    userChittiList.removeWhere((element) => element == null);
    notifyListeners();
  }
}
