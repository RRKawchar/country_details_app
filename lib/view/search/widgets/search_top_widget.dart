import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
import 'package:countries_details_app/view/search/widgets/search_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTopWidget extends StatelessWidget {
  final FilterController searchController;
  const SearchTopWidget({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios),),
        Expanded(child: SearchTextField(searchController: searchController)),
      ],
    );
  }
}
