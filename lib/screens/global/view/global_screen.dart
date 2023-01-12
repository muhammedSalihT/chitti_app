import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/screens/global/view_model/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, value, _) {
        return Scaffold(
          body: value.getPage(value.currentBarIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.currentBarIndex,
            onTap: (onTapIndex) {
              value.onTapBottomBar(onTapIndex);
            },
            selectedItemColor: AppColors.secondryColor,
            unselectedItemColor: AppColors.blackColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_atm_rounded), label: "All chitts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_atm_rounded), label: "My chitts")
            ],
          ),
        );
      },
    );
  }
}
