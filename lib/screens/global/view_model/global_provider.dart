import 'package:chit_app/screens/all_chitti/view/all_chitti_screen.dart';
import 'package:chit_app/screens/user_info/view/user_info_screen.dart';
import 'package:flutter/cupertino.dart';

class GlobalProvider extends ChangeNotifier {
  int currentBarIndex = 0;

  void onTapBottomBar(int index) {
    currentBarIndex = index;
    notifyListeners();
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const AllChittiScreen();
      default:
        return const UserInfoScreen();
    }
  }
}
