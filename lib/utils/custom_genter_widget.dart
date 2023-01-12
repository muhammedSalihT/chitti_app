import 'package:chit_app/screens/registration/view_model/registration_provider.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key? key,
    required this.text,
    required this.genterType,
  }) : super(key: key);

  final String text;
  final String genterType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: CustomTextWidget(
          text: text,
          textSize: 30,
          onTap: () {
            context.read<RegisterProvider>().selectGenter(genterType);
          },
        ),
      ),
    );
  }
}
