import 'package:countries_details_app/%20view_model/controller/home_controller.dart';
import 'package:countries_details_app/view/details/country_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  final homeController = Get.put(HomeController());
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
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Obx(
                () {
                  if (homeController.countries.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: 23,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Get.to(CountryDetails(countryModel: homeController.countries[index],));
                          },
                          child: Card(
                            child: ListTile(
                                leading: Container(
                                  height: double.infinity,
                                  width: 70,
                                  color: Colors.red,
                                  child: Image.network(homeController
                                      .countries[index].flags!.png
                                      .toString()),
                                ),
                                title: Text(homeController.countries[index].name
                                    .toString()),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    homeController.countries[index].capital ==
                                            null
                                        ? const Text("")
                                        : Text(homeController
                                            .countries[index].capital!.first
                                            .toString()),
                                    if (homeController
                                            .countries[index].maps!.googleMaps !=
                                        null)
                                      ElevatedButton(
                                        onPressed: () {
                                          _openGoogleMaps(homeController
                                              .countries[index].maps!.googleMaps!);
                                        },
                                        child: const Text('Open Google Maps'),
                                      ),
                                  ],
                                )),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openGoogleMaps(String url) async {
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true);
    } else {
      // Handle error if the URL cannot be opened
    }
  }
}
