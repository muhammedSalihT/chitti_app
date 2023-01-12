import 'package:chit_app/screens/login/view/login_screen.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class UserInfoProvider extends ChangeNotifier {
  void logOutUser(
    context,
  ) async {
    final loginDb = await Hive.openBox("login_box");
    loginDb.deleteAll(loginDb.keys);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.userChittiList.clear();
    RoutesManager.removeAllScreen(screen: const LoginScreen());
    notifyListeners();
  }
}
