import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final FilterController searchController;
  const SearchTextField({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: searchController.srController.value,
        onChanged: (value) {
          searchController.searchCountryByNameT(value);
        },
        onSubmitted: (value) {
          searchController.searchFocusNode.value.unfocus();
        },
        decoration: InputDecoration(
          hintText: 'search_hint'.tr,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              searchController.srController.value.clear();
              searchController.searchFocusNode.value.unfocus();
            },
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
