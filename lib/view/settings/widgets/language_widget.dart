import 'package:countries_details_app/%20view_model/controller/settings_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  final SettingsController settingsController;
  const LanguageWidget({Key? key, required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomText(text:"language".tr,),
      title: Obx(
            () => DropdownButton(
            hint: const Text('Select Language'),
            elevation: 4,
            iconSize: 30,
            items: settingsController.languageList.map((language) {
              return DropdownMenuItem(
                  value: language,
                  child: CustomText(
                    text: language,
                  ));
            }).toList(),
            value: settingsController.selectedLanguage.value == ""
                ? null
                : settingsController.selectedLanguage.value,
            onChanged: (value) {
              String languageCode =
              settingsController.getLanguageCode(value!);
              settingsController.changeLanguage(languageCode, 'US');
            }),
      ) ,
    );
  }
}
