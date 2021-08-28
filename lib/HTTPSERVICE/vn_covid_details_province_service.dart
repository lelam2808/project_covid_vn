import 'dart:convert';

import 'package:project_covid_vn/models/vn_covid_details_province.dart';
import 'package:http/http.dart' as http;
class VnCovidDetailsProvinceService{
  static final baseUrl="https://api.ncovvn.xyz/cityvn";
  static Future<List<DetailsCovidInEachProvince>> getCovidProvinceDetails()async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      final vnCovidDetailsProvince=detailsCovidInEachProvinceFromJson(respone.body);
      return vnCovidDetailsProvince;
    }
    else{
      return throw("error");
    }

  }
}