import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionWidget extends StatelessWidget {
  const TermsConditionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: (){
      },
      leading: CustomText(text:'term_condition'.tr,),
      title:const Padding(
        padding: EdgeInsets.only(right: 60),
        child: Icon(Icons.looks),
      ) ,
    );
  }
}
