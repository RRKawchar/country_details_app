import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
import 'package:countries_details_app/view/search/widgets/search_body_item.dart';
import 'package:countries_details_app/view/search/widgets/search_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountrySearchScreen extends StatelessWidget {
  CountrySearchScreen({super.key});
  final _searchController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            /// Back Button and Search TextField

            SearchTopWidget(searchController: _searchController),
            const Divider(thickness: 2),
        /// Search Body show item
            Expanded(
              child: SearchBodyItem(searchController: _searchController,)
            ),
          ],
        ),
      ),
    );
  }
}
