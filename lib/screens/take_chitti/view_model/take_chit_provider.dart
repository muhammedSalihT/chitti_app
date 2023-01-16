import 'package:chit_app/screens/all_chitti/model/all_chitti_model.dart';
import 'package:chit_app/screens/registration/model/registration_model.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
import 'package:chit_app/screens/user_info/model/user_chitti_model.dart';
import 'package:chit_app/utils/components.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class TakeChitProvider extends ChangeNotifier {
  TextEditingController numberController = TextEditingController(),
      mailController = TextEditingController();

  Future<RegistrationModel> getUserdata() async {
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
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.userChittiList.add(userChittiModel);
    final userChittiDb = await Hive.openBox("chittis");
    userChittiDb.put(currentUserData.email, splashProvider.userChittiList);
    RoutesManager.backScreen();
    Components.getSnackBar(context, "Added Succesfully");
    notifyListeners();
  }
}
