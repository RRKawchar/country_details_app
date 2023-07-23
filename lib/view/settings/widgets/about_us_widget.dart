import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
      },
      leading: CustomText(text:'about'.tr,),
      title:const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Icon(Icons.add_business_outlined),
      ) ,
    );
  }
}
