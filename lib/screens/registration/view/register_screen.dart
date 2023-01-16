import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/registration/view_model/registration_provider.dart';
import 'package:chit_app/utils/custom_genter_widget.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:chit_app/utils/custom_textform_widget.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Form(
                key: RegisterProvider.regKey,
                child: Column(
                  children: [
                    Box.sizedBox1,
                    TextFormWidget(
                      errorMessege: ConstText.errorName,
                      controller: context.read<RegisterProvider>().name,
                      label: "Name",
                      hideData: false,
                      hint: "Your Name",
                      icon: Icons.account_circle,
                      textType: TextInputType.name,
                    ),
                    Box.sizedBox2,
                    TextFormWidget(
                      errorMessege: ConstText.errorMail,
                      controller: context.read<RegisterProvider>().email,
                      label: "Email",
                      hideData: false,
                      hint: "ENTER YOUR EMAIL",
                      icon: Icons.email_outlined,
                      textType: TextInputType.multiline,
                    ),
                    Box.sizedBox2,
                    TextFormWidget(
                      errorMessege: ConstText.errorNumber,
                      controller: context.read<RegisterProvider>().mobileNumber,
                      label: "Mobile Number",
                      hideData: false,
                      hint: "ENTER YOUR NUMBER",
                      icon: Icons.email_outlined,
                      textType: TextInputType.number,
                    ),
                    Box.sizedBox2,
                    TextFormWidget(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      children: [
                                        CustomGenderWidget(
                                            text: ConstText.gender1,
                                            genterType: ConstText.gender1),
                                        CustomGenderWidget(
                                            text: ConstText.gender2,
                                            genterType: ConstText.gender2),
                                        CustomGenderWidget(
                                            text: ConstText.gender3,
                                            genterType: ConstText.gender3),
                                      ],
                                    ),
                                  ],
                                ));
                          },
                        );
                      },
                      readOnly: true,
                      label: "Gender",
                      errorMessege: ConstText.errorGender,
                      controller: context.read<RegisterProvider>().genter,
                      hideData: false,
                      hint: "SELECT GENDER ",
                      icon: Icons.accessibility_outlined,
                      textType: TextInputType.none,
                    ),
                    Box.sizedBox2,
                    TextFormWidget(
                      errorMessege: ConstText.errorPass,
                      controller: context.read<RegisterProvider>().pass,
                      label: "password",
                      hideData: context.read<RegisterProvider>().hidePassword,
                      suffixIcon: context
                          .watch<RegisterProvider>()
                          .hidePasswordButton(),
                      hint: "ENTER PASSWORD",
                      icon: Icons.password_rounded,
                      textType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextButton(
                        onPressed: () {
                          RoutesManager.backScreen();
                        },
                        child: const Text(
                          "Already Here! Login?",
                          style: TextStyle(color: AppColors.blackColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.blackColor,
                        ),
                        onPressed: () {
                          context
                              .read<RegisterProvider>()
                              .registerHere(context);
                        },
                        child: CustomTextWidget(
                          text: ConstText.signUp,
                          textColor: AppColors.bgColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
