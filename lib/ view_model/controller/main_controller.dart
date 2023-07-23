import 'package:countries_details_app/view/continents/continent_screen.dart';
import 'package:countries_details_app/view/home/home_screen.dart';
import 'package:countries_details_app/view/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  final List<Widget> pages = [
    const HomeScreen(),
    const ContinentScreen(),
    const SettingsScreen()
  ];

  RxInt selectedIndex=0.obs;

  void onTapped(int index){
    selectedIndex.value=index;
  }

}