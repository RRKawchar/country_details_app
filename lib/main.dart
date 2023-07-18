import 'package:countries_details_app/res/routes/routes.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:countries_details_app/view/home/home_screen.dart';
import 'package:countries_details_app/view/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries Details',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      //getPages: AppRoutes.appRoutes(),
    );
  }
}
