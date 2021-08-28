import 'dart:convert';

import 'package:project_covid_vn/models/vn_vaccine.dart';
import 'package:http/http.dart' as http;
class VnVaccine {
  static final baseUrl = "https://api-kent.netlify.app/.netlify/functions/api/vn/daily/vaccines/";
  static Future<Data> getVnVaccine() async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      final List<Data> result=vaccineFromJson(respone.body).data;
      // print(result[result.length-1].date);
      return result[result.length-1];
    }
    else{
      return throw("error");
    }
  }
}