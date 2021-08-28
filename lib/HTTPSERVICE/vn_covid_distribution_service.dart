
import 'package:project_covid_vn/models/vn_case_province.dart';
import 'package:http/http.dart'as http;
class VnCaseProvinceService{
  static final baseUrl="https://api.ncovvn.xyz/cityvn/";
  static Future<List<VnCaseProvince>> getVnCovidProvince() async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      final vnCovidProvince= vnCaseProvinceFromJson(respone.body);
      return vnCovidProvince;
    }
    else{
      return throw("error");
    }
  }
}
