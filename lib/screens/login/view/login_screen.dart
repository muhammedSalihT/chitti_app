import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/login/view_model/login_provider.dart';
import 'package:chit_app/screens/registration/view/register_screen.dart';
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
              errorMessege: "Please Enter Your Email"),
          Box.sizedBox2,
          TextFormWidget(
              label: ConstText.pass,
              suffixIcon: context.watch<LoginProvider>().hidePasswordButton(),
              hideData: context.read<LoginProvider>().hidePassword,
              hint: ConstText.pass,
              icon: Icons.security_update_good,
              textType: TextInputType.emailAddress,
              controller: provider.pass,
              errorMessege: "Please Enter your password"),
          TextButton(
            onPressed: () {
              RoutesManager.nextScreen(screen: const RegistrationScreen());
            },
            child: const Text(
              "New to Here! Register?",
              style: TextStyle(color: AppColors.blackColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                provider.singInHere(context);
              },
              child: const Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
