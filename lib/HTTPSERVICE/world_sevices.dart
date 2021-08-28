import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_covid_vn/models/world_case.dart';
import 'package:http/http.dart' as http;
class WorldCaseService{
  static final baseUrl="https://api.ncovvn.xyz/wom/";
  static Future<WorldCase> getWorldCase() async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      final result = jsonDecode(respone.body);
      WorldCase worldCase= WorldCase.fromJson(result);
      return worldCase;
    }
    else{
      return throw("error");
    }
  }
}