import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_covid_vn/models/vn_case.dart';
import 'package:project_covid_vn/models/world_case.dart';
import 'package:http/http.dart' as http;
class VnCaseService{
  static final baseUrl="https://api.ncovvn.xyz/wom/countries/vietnam/";
  static Future<VnCase> getVNCase() async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      // final result=JsonDecoder(respone.body);
     final VnCase vnCase=vnCaseFromJson(respone.body);
      // print(vnCase.updated);
      return vnCase;
    }
    else{
      return throw("error");
    }
  }
}