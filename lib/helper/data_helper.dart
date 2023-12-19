import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hatirlatma_orthesap/model/lessons.dart';

class DataHelper {
  static List<Lessons> allAddedLessons = [];
  static addLesson(Lessons lesson) {
    allAddedLessons.add(lesson);
  }

  static double calculateAverage() {
    double totalNote = 0;
    double totalCredit = 0;
    allAddedLessons.forEach((element) {
      totalNote = totalNote + (element.credit * element.letter);
      totalCredit += element.credit;
    });
    return totalNote / totalCredit;
  }

  static List<String> _allLessonsLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _letterToNote(String letter) {
    switch (letter) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLettersDDMI() {
    return _allLessonsLetters()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _letterToNote(e),
          ),
        )
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allLessonsCredits() {
    return _allCredits()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
