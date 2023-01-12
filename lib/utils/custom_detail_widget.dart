import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomDeatilsWidget extends StatelessWidget {
  const CustomDeatilsWidget({
    Key? key,
    required this.contentText,
    required this.detailText,
  }) : super(key: key);

  final String contentText;
  final String detailText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: contentText,
          textWeight: FontWeight.w400,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              text: detailText.toString(),
              textWeight: FontWeight.w800,
              textSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
