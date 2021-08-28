import 'dart:convert';

List<DetailsCovidInEachProvince> detailsCovidInEachProvinceFromJson(String str) => List<DetailsCovidInEachProvince>.from(json.decode(str).map((x) => DetailsCovidInEachProvince.fromJson(x)));

String detailsCovidInEachProvinceToJson(List<DetailsCovidInEachProvince> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailsCovidInEachProvince {
  DetailsCovidInEachProvince({
    required this.updatedAt,
    required this.diaDiem,
    required this.tongCaNhiem,
    required this.homNay,
    required this.tuVong,
  });

  int updatedAt;
  String diaDiem;
  int tongCaNhiem;
  int homNay;
  int tuVong;

  factory DetailsCovidInEachProvince.fromJson(Map<String, dynamic> json) => DetailsCovidInEachProvince(
    updatedAt: json["updatedAt"],
    diaDiem: json["dia_diem"],
    tongCaNhiem: json["tong_ca_nhiem"],
    homNay: json["hom_nay"],
    tuVong: json["tu_vong"],
  );

  Map<String, dynamic> toJson() => {
    "updatedAt": updatedAt,
    "dia_diem": diaDiem,
    "tong_ca_nhiem": tongCaNhiem,
    "hom_nay": homNay,
    "tu_vong": tuVong,
  };
}
