import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){

      },
      leading: CustomText(text:'privacy_policy'.tr,),
      title:const Icon(Icons.privacy_tip_outlined) ,
    );
  }
}
