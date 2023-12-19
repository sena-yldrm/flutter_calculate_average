import 'package:flutter/material.dart';
import 'package:flutter_hatirlatma_orthesap/constant/app_constant.dart';
import 'package:flutter_hatirlatma_orthesap/helper/data_helper.dart';
import 'package:flutter_hatirlatma_orthesap/model/lessons.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Lessons> allLessons = DataHelper.allAddedLessons;

    return allLessons.length > 0
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  child: ListTile(
                    title: Text(allLessons[index].name),
                    leading: CircleAvatar(
                      backgroundColor: AppConstants.primaryColorr,
                      child: Text(
                          (allLessons[index].letter * allLessons[index].credit)
                              .toStringAsFixed(0)),
                    ),
                    subtitle: Text(
                        "${allLessons[index].credit} Credit , Note ${allLessons[index].letter}"),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                "Please add lesson",
                style:
                    TextStyle(fontSize: 24, color: AppConstants.primaryColorr),
              ),
            ),
          );
  }
}
