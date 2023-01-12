import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/login/view/login_screen.dart';
import 'package:chit_app/screens/registration/db/registration_db.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:chit_app/utils/components.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController(),
      name = TextEditingController(),
      mobileNumber = TextEditingController(),
      pass = TextEditingController(),
      genter = TextEditingController();

  static var regKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hideRePassword = true;

  void registerHere(context) async {
    if (validated()) {
      final registrationModel = RegistrationModel(
          name.text,
          email.text,
          mobileNumber.text,
          genter.text,
          pass.text,
          DateTime.now().toString(),
          false);
      final isregistered =
          await RegistrationDb.registeringUser(registrationModel);
      if (isregistered) {
        Components.getSnackBar(context, ConstText.errormsg3);
      } else {
        Components.getSnackBar(context, ConstText.loginMsg);
        registrationComplete(context);
      }
    } else {
      Components.getSnackBar(context, ConstText.errorMsg2);
    }
  }

  void registrationComplete(BuildContext context) {
    disposeMethod(context);
    RoutesManager.removeScreen(screen: const LoginScreen());
  }

  void selectGenter(String selectedGenter) {
    genter.text = selectedGenter;
    RoutesManager.backScreen();
    notifyListeners();
  }

  bool validated() {
    if (regKey.currentState!.validate()) {
      return true;
    } else {
      return false;
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
    name.clear();
    mobileNumber.clear();
    genter.clear();
  }
}
