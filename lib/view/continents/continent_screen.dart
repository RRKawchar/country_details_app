import 'package:countries_details_app/models/continent_model.dart';
import 'package:countries_details_app/view/continents/widgets/continent_single_item.dart';
import 'package:flutter/material.dart';

class ContinentScreen extends StatefulWidget {
  const ContinentScreen({Key? key}) : super(key: key);

  @override
  State<ContinentScreen> createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: continentList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 250,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ContinentSingleItem(
              index: index,
              continentList: continentList,
            );
          },
        ),
      ),
    );
  }
}
