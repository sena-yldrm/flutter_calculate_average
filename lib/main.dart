import 'package:flutter/material.dart';
import 'package:flutter_hatirlatma_orthesap/constant/app_constant.dart';
import 'package:flutter_hatirlatma_orthesap/widgets/average_calculation_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dynamic Average Calculation",
      theme: ThemeData(
        primarySwatch: AppConstants.primaryColorr,
        visualDensity: VisualDensity.adaptivePlatformDensity
        
      ),
      home: AverageCalculationPage(),
    );
  }
}
