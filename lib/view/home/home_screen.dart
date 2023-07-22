import 'package:countries_details_app/%20view_model/controller/home_controller.dart';
import 'package:countries_details_app/res/components/custom_text.dart';
import 'package:countries_details_app/res/utils.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:countries_details_app/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const CustomText(
          text: "Countries",
          fontWeight: FontWeight.bold,
          size: 30,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(CountrySearchScreen());
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              ))
        ],
      ),
      body: SafeArea(
        child: Obx(
              () {
            if (homeController.countriesList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: homeController.countriesList.length,
              itemBuilder: (context, index) {
                final countriesList=homeController.countriesList[index];
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
          },
        ),
      ),
    );
  }

  // void _openGoogleMaps(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true);
  //   } else {
  //     // Handle error if the URL cannot be opened
  //   }
  // }
}
