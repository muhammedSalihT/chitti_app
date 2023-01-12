import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/screens/all_chitti/view_model/all_chitti_provider.dart';
import 'package:chit_app/screens/take_chitti/view/take_chitti_screen.dart';
import 'package:chit_app/utils/custom_detail_widget.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class AllChittiScreen extends StatelessWidget {
  const AllChittiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allChittiProvider = context.read<AllChittiProvider>();
    return Scaffold(
        body: SafeArea(
            child: AnimationConfiguration.staggeredGrid(
      position: 2,
      columnCount: 3,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        curve: Curves.easeInCirc,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final allChittList = allChittiProvider.allChitiList;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  RoutesManager.nextScreen(
                      screen: TakeChittiiScreen(
                    allChitti: allChittList[index],
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: allChittList[index].boxColor,
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: allChittList[index].chitName,
                          textSize: 40,
                        ),
                        Box.sizedBox1,
                        CustomDeatilsWidget(
                            contentText: "NUMBER OF PEOPLE",
                            detailText:
                                allChittList[index].peopleCount.toString()),
                        Box.stdBox,
                        CustomDeatilsWidget(
                            contentText: "EMI",
                            detailText: allChittList[index].chitEmi.toString()),
                        Box.stdBox,
                        CustomDeatilsWidget(
                            contentText: "Chit Ammount",
                            detailText:
                                allChittList[index].chitAmmount.toString()),
                        Box.stdBox,
                        CustomDeatilsWidget(
                            contentText: "DURATION",
                            detailText:
                                "${(allChittiProvider.allChitiList[index].duration).toString()} MONTH"),
                        Box.stdBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const CustomTextWidget(
                                  text: "Start Date",
                                  textWeight: FontWeight.w400,
                                ),
                                Box.stdBox,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      text: "10/1/2023",
                                      textWeight: FontWeight.w800,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const CustomTextWidget(
                                  text: "End Date",
                                  textWeight: FontWeight.w400,
                                ),
                                Box.stdBox,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      text: "10/10/2023",
                                      textWeight: FontWeight.w800,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: allChittiProvider.allChitiList.length,
        ),
      ),
    )));
  }
}
