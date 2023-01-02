import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CustomTextWidget(
        text: "CHITTI APP",
        textColor: Colors.red,
        textSize: 50,
        textWeight: FontWeight.w800,
      )),
    );
  }
}
