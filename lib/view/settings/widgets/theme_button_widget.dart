import 'package:countries_details_app/%20view_model/controller/settings_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeButtonWidget extends StatelessWidget {
  final SettingsController settingsController;
  const ThemeButtonWidget({Key? key, required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          onTap: (){
            settingsController.darkTheme();
          },
          leading: CustomText(text:'dark_mode'.tr,),
          title:const Icon(Icons.dark_mode) ,
        ),
        ListTile(
          onTap: (){
            settingsController.lightTheme();
          },
          leading: CustomText(text:'light_mode'.tr,),
          title:const Icon(Icons.light_mode) ,
        ),
      ],
    );
  }
}
