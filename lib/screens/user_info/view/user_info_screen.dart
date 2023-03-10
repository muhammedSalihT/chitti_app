import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
import 'package:chit_app/screens/user_info/model/user_chitti_model.dart';
import 'package:chit_app/screens/user_info/view_model/user_info_provider.dart';
import 'package:chit_app/utils/custom_detail_widget.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserInfoProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondryColor,
        elevation: 20,
        shadowColor: AppColors.secondryColor,
        actions: [
          Row(
            children: [
              const CustomTextWidget(
                textColor: AppColors.bgColor,
                text: "Logout Here",
                textWeight: FontWeight.w700,
              ),
              IconButton(
                onPressed: () {
                  userProvider.logOutUser(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: AnimationConfiguration.staggeredGrid(
          duration: const Duration(milliseconds: 500),
          position: 2,
          columnCount: 1,
          child: FadeInAnimation(
            curve: Curves.easeInQuad,
            child: Consumer<SplashProvider>(
              builder: (context, splashProvider, _) {
                if (splashProvider.userChittiList.isEmpty) {
                  return Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          userProvider.goTakeChit(context);
                        },
                        child: Lottie.asset("assets/lf20_XyWejw.json",
                            height: 200, width: 200, animate: true),
                      ),
                      const CustomTextWidget(text: "Please take any chit")
                    ],
                  ));
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      UserChittiModel data = splashProvider
                          .userChittiList.reversed
                          .toList()[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                CustomTextWidget(
                                  text: data.chittiName!,
                                  textSize: 40,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomDeatilsWidget(
                                    contentText: "Number of Chits",
                                    detailText: data.chitNumber!),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomDeatilsWidget(
                                    contentText: "Total ammount",
                                    detailText: data.totalAmmount!),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomDeatilsWidget(
                                    contentText: "Contact Number",
                                    detailText: data.userNumber!),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: splashProvider.userChittiList.length,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
