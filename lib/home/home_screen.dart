import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/example_screen.dart';
import 'package:shop_app/home/components/search_field.dart';
import 'package:shop_app/provider/country_provider.dart';
import '../constants.dart';
import '../size_config.dart';
import 'components/country_listtile_widget.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);
    final allCountries = provider.countriesSorted;
    SizeConfig().init(context);
    return Provider<CountryProvider>(
      create: (BuildContext context) =>provider,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            // SearchField(),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(10),
                  left: getProportionateScreenWidth(10),
                  right: getProportionateScreenWidth(10)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  onChanged: (value) {
                    provider.loadCountriesWithQuery(value);
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Qidiruv...",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenWidth(11)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: allCountries.map((country) {
                  return CountryListTileWidget(
                    country: country,
                    isSelected: false,
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExampleScreen(
                          name: country.name.replaceAll(" ", "_").toLowerCase(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
