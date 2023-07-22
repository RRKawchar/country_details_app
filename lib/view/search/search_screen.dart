import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
import 'package:countries_details_app/res/components/custom_text.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountrySearchScreen extends StatelessWidget {

   CountrySearchScreen({super.key});

   final FilterController _filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _filterController.srController.value,
                onChanged: (value) {
                  _filterController.searchCountryByNameT(value);
                },
                onSubmitted: (value){

                  _filterController.searchFocusNode.value.unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: (){
                      _filterController.srController.value.clear();
                      _filterController.searchCountryByNameT('');
                      _filterController.searchFocusNode.value.unfocus();
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
            ),
            const Divider(thickness: 2,),
            Expanded(
              child: Obx(() {

                if (_filterController.srController.value.text.isEmpty) {
                  return Container();
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    itemCount: _filterController.countries.length,
                    itemBuilder: (context, index) {
                      final countriesList=_filterController.countries[index];
                      return InkWell(
                        onTap: () {
                          Get.to(CountryDetails(
                            countryModel:countriesList,
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 70,
                            color: Colors.red,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Image.network(countriesList.flags!.png.toString()),
                          ),
                          title:CustomText(text: countriesList.name.toString(),),
                          trailing: CustomText(text: countriesList.cioc.toString(),),

                          // subtitle: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     countriesList.capital == null
                          //         ? const Text("")
                          //         : Text(countriesList.capital!.first.toString()),
                          //     if (countriesList.maps!.googleMaps != null)
                          //       ElevatedButton(
                          //         onPressed: () {
                          //           _openGoogleMaps(countriesList.maps!.googleMaps!);
                          //         },
                          //         child: const Text('Open Google Maps'),
                          //       ),
                          //   ],
                          // ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}