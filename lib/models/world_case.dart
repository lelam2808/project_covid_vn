import 'package:flutter/cupertino.dart';

class WorldCase {
  late int updated;
  late int cases;
  late int todayCases;
  late int deaths;
  late int todayDeaths;
  late int recovered;
  late int todayRecovered;
  late int active;
  late int critical;
  late int affectedCountries;

  WorldCase({
      required this.updated,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.affectedCountries});
  WorldCase.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['todayRecovered'] = this.todayRecovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['affectedCountries'] = this.affectedCountries;
    return data;
  }
}
// class WorldCase {
//   late int cases;
//   late int todayCases;
//   late int deaths;
//   late int todayDeaths;
//   late int recovered;
//   late int todayRecovered;
//   late int active;
//   late int population;
//   late int affectedCountries;
//
//   WorldCase(
//       {required this.cases,
//         required this.todayCases,
//         required this.deaths,
//         required this.todayDeaths,
//         required this.recovered,
//         required this.todayRecovered,
//         required this.active,
//         required this.population,
//         required this.affectedCountries});
//
//   WorldCase.fromJson(Map<String, dynamic> json) {
//     cases = json['cases'];
//     todayCases = json['todayCases'];
//     deaths = json['deaths'];
//     todayDeaths = json['todayDeaths'];
//     recovered = json['recovered'];
//     todayRecovered = json['todayRecovered'];
//     active = json['active'];
//     population = json['population'];
//     affectedCountries = json['affectedCountries'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cases'] = this.cases;
//     data['todayCases'] = this.todayCases;
//     data['deaths'] = this.deaths;
//     data['todayDeaths'] = this.todayDeaths;
//     data['recovered'] = this.recovered;
//     data['todayRecovered'] = this.todayRecovered;
//     data['active'] = this.active;
//     data['population'] = this.population;
//     data['affectedCountries'] = this.affectedCountries;
//     return data;
//   }
// }