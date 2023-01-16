import 'package:chit_app/constends/const_box.dart';
import 'package:chit_app/utils/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomDateWidget extends StatelessWidget {
  const CustomDateWidget({
    Key? key,
    this.text,
    this.date,
  }) : super(key: key);

  final String? text;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: text ?? "End Date",
          textWeight: FontWeight.w400,
        ),
        Box.stdBox,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              text: date ?? "10/10/2023",
              textWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
