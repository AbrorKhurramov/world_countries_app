import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/models/country.dart';

import '../utils.dart';

class CountryProvider with ChangeNotifier {
  CountryProvider() {
    loadCountries().then((countries) {
      countries.forEach((element) {
        _countries.add(Country(
          phone: element.phone,
          area: element.area,
          population: element.population,
          continent: element.continent,
          currency: element.currency,
          capital: element.capital,
          name: element.name,
          nativeName: element.nativeName,
          code: element.code,
        ));
        _countriesSorted.add(Country(
          phone: element.phone,
          area: element.area,
          population: element.population,
          continent: element.continent,
          currency: element.currency,
          capital: element.capital,
          name: element.name,
          nativeName: element.nativeName,
          code: element.code,
        ));
      });
      notifyListeners();
    });
  }

  List<Country> _countries = [];

  List<Country> get countries => _countries;
  List<Country> _countriesSorted = [];

  List<Country> get countriesSorted => _countriesSorted;

  Future<List<Country>> loadCountries() async {
    final data = await rootBundle.loadString('assets/country_codes.json');
    final countriesJson = json.decode(data);
    return countriesJson.keys.map<Country>((code) {
      final json = countriesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});
      return Country.fromJson(newJson);
    }).toList()
      ..sort(Utils.ascendingSort);
  }

  loadCountriesWithQuery(String query) {
    _countriesSorted.clear();
    _countries.forEach((element) {
      _countriesSorted.add(Country(
        phone: element.phone,
        area: element.area,
        population: element.population,
        continent: element.continent,
        currency: element.currency,
        capital: element.capital,
        name: element.name,
        nativeName: element.nativeName,
        code: element.code,
      ));
    });
    if (query.isNotEmpty)
      _countriesSorted.removeWhere((element) =>
          !element.name.toLowerCase().startsWith(query.toLowerCase()));
    notifyListeners();
  }
}
