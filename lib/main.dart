import 'package:countries_details_app/%20view_model/controller/settings_controller.dart';
import 'package:countries_details_app/res/localization/languages.dart';
import 'package:countries_details_app/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final settingController=Get.put(SettingsController());
    settingController.changeTheme();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries Details',
      fallbackLocale: const Locale('en','US'),
      locale: const Locale('en','US'),
      translations: Languages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: const HomeScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
