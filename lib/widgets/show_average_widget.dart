import 'package:flutter/material.dart';
import 'package:flutter_hatirlatma_orthesap/constant/app_constant.dart';

class ShowAverageWidget extends StatelessWidget {
  final double average;
  final int lessonNumber;
  const ShowAverageWidget(
      {required this.average, required this.lessonNumber, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonNumber > 0
              ? "$lessonNumber lessons selected"
              : "please choose lessons",
          style: AppConstants.lessonNumberStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: AppConstants.averageStyle,
        ),
        Text(
          "Average",
          style: AppConstants.lessonNumberStyle,
        ),
      ],
    );
  }
}
