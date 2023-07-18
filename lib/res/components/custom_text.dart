import 'package:countries_details_app/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int maxLines;
  final double size;
  final Color color;
  final FontWeight? fontWeight;
  const CustomText({
    Key? key,
    required this.text,
    this.maxLines = 2,
    this.size = 15.0,
    this.color = AppColor.secondaryColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
