import 'package:countries_details_app/%20view_model/controller/continent_controller.dart';
import 'package:countries_details_app/components/custom_text.dart';
import 'package:countries_details_app/view/continents_countries/widgets/continents_countries_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinentsCountries extends StatefulWidget {
  final List<Map<String, dynamic>> continentList;
  final int index;
  const ContinentsCountries(
      {Key? key, required this.index, required this.continentList})
      : super(key: key);

  @override
  State<ContinentsCountries> createState() => _ContinentsCountriesState();
}

class _ContinentsCountriesState extends State<ContinentsCountries> {
  final continentController = Get.put(ContinentController());
  @override
  void initState() {
    continentController
        .fetchContinentsCountries(widget.continentList[widget.index]['name']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: CustomText(
          text: widget.continentList[widget.index]['name'],
          size: 30,
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Obx(() {
            if (continentController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ContinentsCountriesItem(
              continentController: continentController,
            );
          })),
    );
  }
}
