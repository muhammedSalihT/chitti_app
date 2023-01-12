import 'dart:developer';
import 'package:chit_app/screens/all_chitti/model/all_chitti_model.dart';
import 'package:chit_app/screens/all_chitti/view_model/all_chitti_provider.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/screens/user_info/model/user_chitti_model.dart';
import 'package:chit_app/utils/components.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class TakeChitProvider extends ChangeNotifier {
  TextEditingController numberController = TextEditingController(),
      mailController = TextEditingController();

  TakeChitProvider() {
    getUserdata();
  }

  Future<RegistrationModel> getUserdata() async {
    log("call get");
    final loginDb = await Hive.openBox("login_box");
    final regDb = await Hive.openBox("reg_box");
    RegistrationModel data = regDb.get(loginDb.get(1));
    numberController.text = data.mobileNumber.toString();
    mailController.text = data.email!.toString();
    return data;
  }

  String itemNumber = "1";
  void getItem(String item) {
    itemNumber = item;
    notifyListeners();
  }

  addChitti(AllChitiModel chitiModel, context) async {
    final currentUserData = await getUserdata();
    final userChittiModel = UserChittiModel(
        currentUserData.id,
        chitiModel.chitName,
        itemNumber,
        numberController.text,
        mailController.text,
        (chitiModel.chitAmmount * int.parse(itemNumber)).toString());
    final loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    loginProvider.userChittiList.add(userChittiModel);
    final userChittiDb = await Hive.openBox("chitti_box");
    userChittiDb.put(currentUserData.email, loginProvider.userChittiList);
    RoutesManager.backScreen();
    Components.getSnackBar(context, "Added Succesfully");
    notifyListeners();
  }
}
