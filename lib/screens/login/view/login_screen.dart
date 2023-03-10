import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/screens/registration/view/register_screen.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:chit_app/utils/custom_textform_widget.dart';
import 'package:chit_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormWidget(
              label: ConstText.mail,
              hideData: false,
              hint: ConstText.mail,
              icon: Icons.email,
              textType: TextInputType.emailAddress,
              controller: provider.email,
              errorMessege: ConstText.errorMail),
          Box.sizedBox2,
          TextFormWidget(
              label: ConstText.pass,
              suffixIcon: context.watch<LoginProvider>().hidePasswordButton(),
              hideData: context.read<LoginProvider>().hidePassword,
              hint: ConstText.pass,
              icon: Icons.security_update_good,
              textType: TextInputType.number,
              controller: provider.pass,
              errorMessege: ConstText.errorPass),
          TextButton(
              onPressed: () {
                RoutesManager.nextScreen(screen: const RegistrationScreen());
              },
              child: CustomTextWidget(
                text: ConstText.goToRegister,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.blackColor,
              ),
              onPressed: () {
                provider.singInHere(context);
              },
              child: CustomTextWidget(
                text: ConstText.signIn,
                textColor: AppColors.bgColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
