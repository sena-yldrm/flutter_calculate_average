import 'package:flutter/material.dart';
import 'package:flutter_hatirlatma_orthesap/helper/data_helper.dart';
import 'package:flutter_hatirlatma_orthesap/model/lessons.dart';
import 'package:flutter_hatirlatma_orthesap/widgets/lessons_list.dart';
import 'package:flutter_hatirlatma_orthesap/widgets/show_average_widget.dart';
import '../constant/app_constant.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({super.key});

  @override
  State<AverageCalculationPage> createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedCredits = 4;
  double selectedLetters = 4;
  String lessonName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            AppConstants.titleText,
            style: AppConstants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //column one
          Row(
            children: [
              //left row
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                //right row
                flex: 1,
                child: Container(
                  child: ShowAverageWidget(
                      average: DataHelper.calculateAverage(),
                      lessonNumber: DataHelper.allAddedLessons.length),
                ),
              ),
            ],
          ),
          //column two
          Expanded(
            child: LessonsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: AppConstants.horizontalPadding,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: AppConstants.horizontalPadding,
                  child: _buildLetters(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppConstants.horizontalPadding,
                  child: _buildCredits(),
                ),
              ),
              IconButton(
                onPressed: _addLessonsAndCalculateAverage,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: AppConstants.primaryColorr,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      //callback function
      onSaved: (value) {
        setState(() {
          lessonName = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Please enter a name for this lesson";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Math',
          border: OutlineInputBorder(
              borderRadius: AppConstants.borderRadius,
              borderSide: BorderSide.none),
          fillColor: AppConstants.primaryColorr.shade100.withOpacity(0.3),
          filled: true),
    );
  }

  _buildLetters() {
    return Container(
      alignment: Alignment.center,
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
        color: AppConstants.primaryColorr.shade100.withOpacity(0.3),
        borderRadius: AppConstants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedLetters,
        elevation: 16,
        iconEnabledColor: AppConstants.primaryColorr,
        onChanged: (value) {
          setState(() {
            selectedLetters = value!;
            print(value);
          });
        },
        underline: Container(),
        items: DataHelper.allLessonsLettersDDMI(),
      ),
    );
  }

  _buildCredits() {
    return Container(
      alignment: Alignment.center,
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
        color: AppConstants.primaryColorr.shade100.withOpacity(0.3),
        borderRadius: AppConstants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedCredits,
        elevation: 16,
        iconEnabledColor: AppConstants.primaryColorr,
        onChanged: (value) {
          setState(() {
            selectedCredits = value!;
            print(value);
          });
        },
        underline: Container(),
        items: DataHelper.allLessonsCredits(),
      ),
    );
  }

  void _addLessonsAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var toBeAddedLessons = Lessons(
          name: lessonName, letter: selectedLetters, credit: selectedCredits);
      DataHelper.addLesson(toBeAddedLessons);
      setState(() {});
      print(DataHelper.calculateAverage());
    }
  }
}
