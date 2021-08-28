// class Vaccine {
//   late String country;
//   late List<Data> data;
//
//   Vaccine({required this.country, required this.data});
//
//   Vaccine.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country'] = this.country;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   late String date;
//   late int totalVaccinations;
//   late int peopleVaccinated;
//   late int dailyVaccinations;
//   late int peopleFullyVaccinated;
//
//   Data(
//       {required this.date,
//         required this.totalVaccinations,
//         required this.peopleVaccinated,
//         required this.dailyVaccinations,
//         required this.peopleFullyVaccinated});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     totalVaccinations = json['total_vaccinations'];
//     peopleVaccinated = json['people_vaccinated'];
//     dailyVaccinations = json['daily_vaccinations'];
//     peopleFullyVaccinated = json['people_fully_vaccinated'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['date'] = this.date;
//     data['total_vaccinations'] = this.totalVaccinations;
//     data['people_vaccinated'] = this.peopleVaccinated;
//     data['daily_vaccinations'] = this.dailyVaccinations;
//     data['people_fully_vaccinated'] = this.peopleFullyVaccinated;
//     return data;
//   }
// }
import 'dart:convert';

Vaccine vaccineFromJson(String str) => Vaccine.fromJson(json.decode(str));

String vaccineToJson(Vaccine data) => json.encode(data.toJson());

class Vaccine {
  Vaccine({
    required this.country,
    required this.data,
  });

  String country;
  List<Data> data;

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
    country: json["country"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.date,
    required this.totalVaccinations,
    required this.peopleVaccinated,
    required this.dailyVaccinations,
    required this.peopleFullyVaccinated,
  });

  DateTime date;
  dynamic totalVaccinations;
  dynamic peopleVaccinated;
  dynamic dailyVaccinations;
  dynamic peopleFullyVaccinated;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    date: DateTime.parse(json["date"]),
    totalVaccinations: json["total_vaccinations"] == null ? null : json["total_vaccinations"],
    peopleVaccinated: json["people_vaccinated"] == null ? null : json["people_vaccinated"],
    dailyVaccinations: json["daily_vaccinations"] == null ? null : json["daily_vaccinations"],
    peopleFullyVaccinated: json["people_fully_vaccinated"] == null ? null : json["people_fully_vaccinated"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "total_vaccinations": totalVaccinations == null ? null : totalVaccinations,
    "people_vaccinated": peopleVaccinated == null ? null : peopleVaccinated,
    "daily_vaccinations": dailyVaccinations == null ? null : dailyVaccinations,
    "people_fully_vaccinated": peopleFullyVaccinated == null ? null : peopleFullyVaccinated,
  };
}
