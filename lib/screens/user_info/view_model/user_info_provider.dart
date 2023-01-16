import 'package:chit_app/screens/global/view_model/global_provider.dart';
import 'package:chit_app/screens/splash_screen/view/spalsh_screen.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
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
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.userChittiList = [];
    goTakeChit(context);
    notifyListeners();
    RoutesManager.removeAllScreen(screen: const SplashScreen());
  }

  goTakeChit(BuildContext context) {
    final globalProvider = Provider.of<GlobalProvider>(context, listen: false);
    globalProvider.onTapBottomBar(0);
    notifyListeners();
  }
}
