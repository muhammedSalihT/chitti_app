import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/screens/all_chitti/model/all_chitti_model.dart';
import 'package:chit_app/screens/take_chitti/view_model/take_chit_provider.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constends/const_colors.dart';

class TakeChittiiScreen extends StatelessWidget {
  const TakeChittiiScreen({
    Key? key,
    required this.allChitti,
  }) : super(key: key);

  final AllChitiModel allChitti;

  @override
  Widget build(BuildContext context) {
    final takeChitProvider = context.read<TakeChitProvider>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ColoredBox(
                  color: allChitti.boxColor,
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: CustomTextWidget(
                            text: allChitti.chitName,
                            textSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  children: [
                    const CustomTextWidget(
                      text: "Chitti Name",
                      textColor: Colors.grey,
                    ),
                    Box.stdBox,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: CustomTextWidget(text: allChitti.chitName)),
                    ),
                    Box.stdBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextWidget(
                              text: "Number Of chits",
                              textColor: Colors.grey,
                            ),
                            Box.stdBox,
                            const CustomDropDownButton(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTextWidget(
                              text: "EMI",
                              textColor: Colors.grey,
                            ),
                            Box.stdBox,
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                  child: CustomTextWidget(
                                      text: allChitti.chitEmi.toString())),
                            ),
                          ],
                        )
                      ],
                    ),
                    Box.stdBox,
                    const CustomTextWidget(
                      text: "Your mobile Number",
                      textColor: Colors.grey,
                    ),
                    Box.stdBox,
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: takeChitProvider.numberController,
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 40, horizontal: 3),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(color: AppColors.bodyGrey),
                        ),
                      ),
                    ),
                    Box.stdBox,
                    const CustomTextWidget(
                      text: "Your Email Adress",
                      textColor: Colors.grey,
                    ),
                    Box.stdBox,
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: takeChitProvider.mailController,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 40, horizontal: 3),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: TextStyle(color: AppColors.bodyGrey),
                        ),
                      ),
                    ),
                    Box.stdBox,
                    const CustomTextWidget(
                      text: "Total ammount ",
                      textColor: Colors.grey,
                    ),
                    Box.stdBox,
                    Consumer<TakeChitProvider>(
                        builder: (context, takeChitProvider, _) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: CustomTextWidget(
                                text: (allChitti.chitAmmount *
                                        int.parse(takeChitProvider.itemNumber))
                                    .toString())),
                      );
                    }),
                    Box.sizedBox2,
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          takeChitProvider.addChitti(allChitti, context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              side: BorderSide(color: Colors.black)),
                        ),
                        child: const CustomTextWidget(
                          text: "Conform Chit",
                          textSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TakeChitProvider>(builder: (context, valu, _) {
      return CustomDropdownButton2(
        buttonDecoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        buttonWidth: 100,
        dropdownWidth: 50,
        buttonHeight: 50,
        value: valu.itemNumber,
        hint: 'Select Item',
        dropdownItems: const [
          "1",
          "2",
          "3",
        ],
        onChanged: (value) {
          valu.getItem(value!);
        },
      );
    });
  }
}
