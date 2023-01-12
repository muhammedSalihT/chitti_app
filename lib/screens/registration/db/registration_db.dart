import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class RegistrationDb {
  static Future<bool> registeringUser(
    RegistrationModel registrationModel,
  ) async {
     final userBoxDb = await Hive.openBox("reg_box");
    if (userBoxDb.keys.contains(registrationModel.email)) {
      return true;
    }
    userBoxDb.put(registrationModel.email, registrationModel);
    return false;
  }
}
