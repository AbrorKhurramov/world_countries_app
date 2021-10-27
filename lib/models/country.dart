import 'package:meta/meta.dart';

class Country {
  final String name;
  final String nativeName;
  final String code;
  final String capital;
  final String phone;
  final String area;
  final String population;
  final String continent;
  final String currency;

  const Country({
    @required this.phone,
    @required this.area,
    @required this.population,
    @required this.continent,
    @required this.currency,
    @required this.capital,
    @required this.name,
    @required this.nativeName,
    @required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      name: json['name'],
      nativeName: json['native'],
      code: json['code'],
      capital: json['capital'],
      phone: json['phone'],
      area: json['area'],
      population: json['population'],
      continent: json['continent'],
      currency: json['currency']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          nativeName == other.nativeName &&
          code == other.code &&
          capital == other.capital &&
          phone == other.phone &&
          area == other.area &&
          population == other.population &&
          continent == other.continent &&
          currency == other.currency;

  @override
  int get hashCode =>
      name.hashCode ^
      nativeName.hashCode ^
      code.hashCode ^
      capital.hashCode ^
      phone.hashCode ^
      area.hashCode ^
      population.hashCode ^
      continent.hashCode ^
      currency.hashCode;
}
