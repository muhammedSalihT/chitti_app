import 'package:flutter/cupertino.dart';

class AllChitiModel {
  final Color boxColor;
  final String chitName;
  final int peopleCount;
  final int chitEmi;
  final int chitAmmount;
  final int duration;
  final String startDate;
  final String endDate;

  AllChitiModel(this.peopleCount, this.chitEmi, this.chitAmmount, this.duration,
      this.startDate, this.endDate, this.chitName, this.boxColor);
}
