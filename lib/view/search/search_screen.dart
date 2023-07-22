import 'package:countries_details_app/%20view_model/controller/search_controller.dart';
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
                  _filterController.searchCountryByName(value);
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
                      _filterController.searchCountryByName('');
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
            Obx(() {
              final country = _filterController.country;
              if (_filterController.srController.value.text.isEmpty) {
                return Container();
              } else {
                return InkWell(
                  onTap: () {
                    Get.to(CountryDetails(
                      countryModel: country,
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        height: double.infinity,
                        width: 70,
                        color: Colors.red,
                        child: Image.network(country.flags!.png.toString()),
                      ),
                      title: Text(country.name.toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          country.capital == null
                              ? const Text("")
                              : Text(country.capital!.first.toString()),
                          if (country.maps!.googleMaps != null)
                            ElevatedButton(
                              onPressed: () {
                                // _openGoogleMaps(country.maps!.googleMaps!);
                              },
                              child: const Text('Open Google Maps'),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}