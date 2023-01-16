import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/global/view/global_screen.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
import 'package:chit_app/utils/components.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController(),
      pass = TextEditingController();

  bool hidePassword = true;

  void singInHere(context) async {
    if (email.text.isEmpty) {
      Components.getSnackBar(context, ConstText.errorMail);
    } else if (pass.text.isEmpty) {
      Components.getSnackBar(context, ConstText.errorPass);
    } else {
      final userBoxDb = await Hive.openBox("reg_box");
      if (userBoxDb.keys.contains(email.text)) {
        RegistrationModel? currentUserModel = userBoxDb.get(email.text);
        if (pass.text == currentUserModel!.password) {
          final loginDb = await Hive.openBox("login_box");
          loginDb.put(1, email.text);
          Provider.of<SplashProvider>(context, listen: false)
              .getUserChittList();
          disposeMethod(context);
          RoutesManager.removeAllScreen(screen: const GlobalScreen());
        } else {
          Components.getSnackBar(context, ConstText.errorMsg5);
        }
      } else {
        Components.getSnackBar(context, ConstText.signUpMsg);
      }
    }
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

  void disposeMethod(context) {
    email.clear();
    pass.clear();
  }
}

