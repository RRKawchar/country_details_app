import 'package:countries_details_app/components/custom_network_image.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String title;
  final String trailing;
  const SingleItem(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.title,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Container(
              height: Get.height,
              width: 80,
              color: Colors.red,
              child: CustomNetworkImage(
                image: image,
              )),
          title: CustomText(
            text: title,
          ),
          trailing: CustomText(
            text: trailing,
          ),
        ),
      ),
    );
  }
}
