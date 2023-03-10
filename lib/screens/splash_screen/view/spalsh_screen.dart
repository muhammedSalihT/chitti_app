import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/constends/text_const.dart';
import 'package:chit_app/screens/splash_screen/view_model/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).isLogged();
    return Scaffold(
      body: Center(
          child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          FadeAnimatedText(
            duration: const Duration(milliseconds: 2500),
            ConstText.appName,
            textStyle: const TextStyle(
                fontSize: 50,
                color: AppColors.secondryColor,
                fontWeight: FontWeight.w800),
          ),
        ],
      )),
    );
  }
}
