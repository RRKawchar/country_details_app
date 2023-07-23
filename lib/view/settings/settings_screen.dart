import 'package:countries_details_app/%20view_model/controller/settings_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/view/settings/widgets/about_us_widget.dart';
import 'package:countries_details_app/view/settings/widgets/language_widget.dart';
import 'package:countries_details_app/view/settings/widgets/privacy_policy_widgert.dart';
import 'package:countries_details_app/view/settings/widgets/term_condition_widget.dart';
import 'package:countries_details_app/view/settings/widgets/theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              CustomText(text: "settings".tr, size: 30),
              const Divider(),
              ThemeButtonWidget(settingsController: settingsController),
              LanguageWidget(settingsController: settingsController),
              const AboutUsWidget(),
              const TermsConditionWidget(),
              const PrivacyPolicyWidget(),
              const Spacer(),
              CustomText(text: "version".tr),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}
