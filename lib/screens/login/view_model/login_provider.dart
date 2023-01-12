import 'dart:developer';

import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/global/view/global_screen.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/utils/components.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController(),
      pass = TextEditingController();

  bool hidePassword = true;
  List<dynamic> userChittiList = [];

  void singInHere(BuildContext context) async {
    if (email.text.isEmpty) {
      Components.getSnackBar(context, "Please enter your email");
    } else if (pass.text.isEmpty) {
      Components.getSnackBar(context, "Please enter your password");
    } else {
      final userBoxDb = await Hive.openBox("reg_box");
      RegistrationModel? currentUserModel = userBoxDb.get(email.text);
      if (userBoxDb.keys.contains(email.text) &&
          pass.text == currentUserModel!.password) {
        final loginDb = await Hive.openBox("login_box");
        loginDb.put(1, email.text);
        getUserChittList(loginDb);
        RoutesManager.removeScreen(screen: const GlobalScreen());
      } else if (userBoxDb.keys.contains(email.text) &&
          pass.text != currentUserModel!.password) {
        // ignore: use_build_context_synchronously
        Components.getSnackBar(context, ConstText.errorMsg4);
      } else {
        // ignore: use_build_context_synchronously
        Components.getSnackBar(context, ConstText.signUpMsg);
      }
    }
  }

  getUserChittList(Box<dynamic> loginDb) async {
    log("callme");
    final userChittiDb = await Hive.openBox("chitti_box");
    log(loginDb.get(1));
    userChittiList.clear();
    userChittiList = userChittiDb.get(loginDb.get(1));
    userChittiList.removeWhere((element) => element == null);
    log(userChittiList.toString());
    notifyListeners();
  }

  Widget hidePasswordButton() {
    return InkWell(
      onTap: () {
        hidePassword = !hidePassword;
        notifyListeners();
      },
      child: hidePassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );
  }
}
